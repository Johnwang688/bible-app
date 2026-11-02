// Frozen verbatim from the approved B-1 privacy-copy.md v2 table, including punctuation.
import { en } from '../../i18n/messages/en';
import { zhHans } from '../../i18n/messages/zh-Hans';

const approved = [
  [
    "privacy.title",
    "Privacy policy",
    "隐私政策"
  ],
  [
    "privacy.updated",
    "Last updated 2 November 2026",
    "最后更新：2026 年 11 月 2 日"
  ],
  [
    "privacy.switchLanguage",
    "简体中文",
    "English"
  ],
  [
    "privacy.back",
    "Back",
    "返回"
  ],
  [
    "privacy.openApp",
    "Open the app",
    "打开应用"
  ],
  [
    "privacy.short.title",
    "The short version",
    "简要说明"
  ],
  [
    "privacy.short.b1",
    "No account needed. What you save stays on your device.",
    "无需账户。你保存的内容留在你的设备上。"
  ],
  [
    "privacy.short.b2",
    "No ads, no analytics, no tracking.",
    "没有广告，没有分析，没有跟踪。"
  ],
  [
    "privacy.short.b3",
    "Signing in is optional. It copies your study data to your account so it syncs.",
    "登录是可选的。登录后，你的学习数据会复制到你的账户中，以便同步。"
  ],
  [
    "privacy.short.b4",
    "You can delete your data at any time.",
    "你可以随时删除你的数据。"
  ],
  [
    "privacy.intro",
    "This page explains what Bible App keeps, where it keeps it, and why.",
    "本页说明本应用会保存什么、保存在哪里，以及为什么。"
  ],
  [
    "privacy.never.title",
    "What we don’t do",
    "我们不做的事"
  ],
  [
    "privacy.never.summary",
    "We don’t show ads, track you or sell your data.",
    "我们不展示广告，不跟踪你，也不出售你的数据。"
  ],
  [
    "privacy.never.b1",
    "No ads, no analytics, no tracking cookies.",
    "没有广告，没有分析工具，没有跟踪 Cookie。"
  ],
  [
    "privacy.never.b2",
    "We don’t sell your data. We don’t share it with anyone except the services that run the app, listed below.",
    "我们不出售你的数据。除下文列出的、用于运行本应用的服务外，我们不与任何人分享。"
  ],
  [
    "privacy.never.b3",
    "The app uses your browser’s storage only to work: to keep what you save and, when you sign in, to keep you signed in.",
    "应用使用浏览器存储只是为了正常运行：保存你的内容，以及在你登录后保持登录状态。"
  ],
  [
    "privacy.device.title",
    "On your device",
    "保存在你设备上的内容"
  ],
  [
    "privacy.device.summary",
    "What you save is stored on this device.",
    "你保存的内容存储在这台设备上。"
  ],
  [
    "privacy.device.b1",
    "Highlights, notes, bookmarks, reading position, recent passages, reading progress, daily goal and settings.",
    "标记、笔记、书签、阅读位置、最近阅读的经文、阅读进度、每日目标和各项设置。"
  ],
  [
    "privacy.device.b2",
    "The age range you can choose when you first open the app, if you choose one.",
    "首次打开应用时可选填的年龄段（如果你选填了）。"
  ],
  [
    "privacy.device.b3",
    "On the web it lives in the browser’s local storage, until you delete it, clear the site’s data or remove the app.",
    "网页版保存在浏览器的本地存储中，直到你删除它、清除网站数据或卸载应用。"
  ],
  [
    "privacy.server.title",
    "What the app downloads",
    "应用会下载什么"
  ],
  [
    "privacy.server.summary",
    "The app downloads Scripture and study content from our server. It never sends what you save.",
    "应用从我们的服务器下载经文和学习内容，绝不发送你保存的内容。"
  ],
  [
    "privacy.server.b1",
    "A request names only the passage, or the words you searched for.",
    "请求中只包含经文出处或你搜索的词语。"
  ],
  [
    "privacy.server.b2",
    "The server runs on Google Cloud in the United States.",
    "服务器运行在美国的 Google Cloud 上。"
  ],
  [
    "privacy.server.b3",
    "Like any web server, it sees your IP address and browser type, and keeps them in its request logs for up to 30 days to run and protect the service.",
    "和所有网络服务器一样，它会看到你的 IP 地址和浏览器类型，并在请求日志中保留最多 30 天，用于运行和保护这项服务。"
  ],
  [
    "privacy.hosting.title",
    "The website and fonts",
    "网站和字体"
  ],
  [
    "privacy.hosting.summary",
    "Other services deliver the website and a font, and see your IP address when they do.",
    "网站和一种字体由其他服务提供，提供时它们会看到你的 IP 地址。"
  ],
  [
    "privacy.hosting.b1",
    "The website is served by Firebase Hosting (Google), which logs requests in the same way.",
    "网站由 Firebase Hosting（Google）提供，它也会以同样的方式记录请求。"
  ],
  [
    "privacy.hosting.b2",
    "The Chinese Scripture font comes from Google Fonts on the web, and is downloaded once from jsDelivr in the phone apps.",
    "中文经文字体在网页上来自 Google Fonts，在手机应用中会从 jsDelivr 下载一次。"
  ],
  [
    "privacy.account.title",
    "If you sign in (optional)",
    "如果你登录（可选）"
  ],
  [
    "privacy.account.summary",
    "Signing in copies your study data to your account so it syncs between your devices.",
    "登录后，你的学习数据会复制到你的账户中，在你的各台设备之间同步。"
  ],
  [
    "privacy.account.b1",
    "Accounts use Firebase Authentication (Google). It keeps your email address and a protected form of your password. The app itself never sees or stores your password.",
    "账户使用 Firebase Authentication（Google）。它会保存你的电子邮件地址和经过保护处理的密码。应用本身从不查看或保存你的密码。"
  ],
  [
    "privacy.account.b2",
    "Your highlights, notes, bookmarks, reading progress and settings are copied to Cloud Firestore (Google, United States). Only your account can read them.",
    "你的标记、笔记、书签、阅读进度和设置会复制到 Cloud Firestore（Google，美国），只有你的账户可以读取。"
  ],
  [
    "privacy.account.b3",
    "Signing out keeps everything on this device.",
    "退出登录后，所有内容仍保留在这台设备上。"
  ],
  [
    "privacy.delete.title",
    "Delete your data",
    "删除你的数据"
  ],
  [
    "privacy.delete.summary",
    "You can delete your data at any time.",
    "你可以随时删除你的数据。"
  ],
  [
    "privacy.delete.b1",
    "Signed in: on the Me tab, choose “Delete account and synced data”. It deletes your account and everything synced to it.",
    "已登录：在“我的”页面选择“删除账户和已同步的数据”，即可删除你的账户以及所有已同步的数据。"
  ],
  [
    "privacy.delete.b2",
    "Not signed in, or to remove what is on this device: clear this site’s data in your browser, or uninstall the app.",
    "未登录，或要删除这台设备上的内容：在浏览器中清除本网站的数据，或卸载应用。"
  ],
  [
    "privacy.delete.b3",
    "Server request logs are deleted on their own after 30 days.",
    "服务器请求日志会在 30 天后自动删除。"
  ],
  [
    "privacy.children.title",
    "Children and teens",
    "儿童和青少年"
  ],
  [
    "privacy.children.summary",
    "Unless you sign in, the app collects no personal details.",
    "除非你登录，应用不会收集任何个人信息。"
  ],
  [
    "privacy.children.age",
    "If you choose “Under 13” when you first open the app, sign-in and sync are turned off. The app then never collects an email address or synced data from you, and everything stays on your phone.",
    "如果你在首次打开应用时选择“13 岁以下”，登录和同步功能将被关闭。应用不会向你收集电子邮件地址或任何同步数据，所有内容都只保存在你的手机上。"
  ],
  [
    "privacy.children.b1",
    "The optional age range stays on your device and is not sent to us.",
    "可选填的年龄段只保存在你的设备上，不会发送给我们。"
  ],
  [
    "privacy.children.b2",
    "You, or a parent or guardian, can ask us to see, correct or delete your data: use “Email us” below.",
    "你本人或你的家长、监护人，都可以要求我们查看、更正或删除你的数据：请使用下方的“给我们发邮件”。"
  ],
  [
    "privacy.contact.title",
    "Questions",
    "联系我们"
  ],
  [
    "privacy.contact.summary",
    "Questions or requests about your data? Email us.",
    "对你的数据有疑问或请求？请给我们发邮件。"
  ],
  [
    "privacy.contact.email",
    "Email us",
    "给我们发邮件"
  ],
  [
    "privacy.contact.copy",
    "Copy email address",
    "复制邮箱地址"
  ],
  [
    "privacy.contact.copied",
    "Email address copied",
    "邮箱地址已复制"
  ],
  [
    "privacy.changes.title",
    "Changes to this policy",
    "本政策的变更"
  ],
  [
    "privacy.changes.summary",
    "If the app starts handling data in a new way, this page changes first.",
    "如果应用开始以新的方式处理数据，我们会先更新本页。"
  ],
  [
    "privacy.changes.b1",
    "The date at the top shows when it last changed.",
    "顶部的日期显示最近一次更新的时间。"
  ],
  [
    "privacy.changes.b2",
    "The app is in beta, so features may still change.",
    "本应用仍处于测试阶段，功能可能还会变化。"
  ]
] as const;

it.each([['en', en, 1], ['zh-Hans', zhHans, 2]] as const)(
  '%s privacy catalogue matches every approved string, with no missing or extra keys',
  (_locale, catalogue, column) => {
    const actual = Object.fromEntries(Object.entries(catalogue).filter(([key]) => key.startsWith('privacy.')));
    const expected = Object.fromEntries(approved.map((row) => [row[0], row[column]]));
    expect(actual).toEqual(expected);
  },
);

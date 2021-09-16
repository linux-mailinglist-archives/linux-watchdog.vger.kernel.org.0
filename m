Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51BF740DCFE
	for <lists+linux-watchdog@lfdr.de>; Thu, 16 Sep 2021 16:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237298AbhIPOlf (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 16 Sep 2021 10:41:35 -0400
Received: from mail-eopbgr80049.outbound.protection.outlook.com ([40.107.8.49]:52992
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236749AbhIPOlf (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 16 Sep 2021 10:41:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=btWOW5zf2PYrrrsUgdQipeM7Xg5j3svFnpjrCdukP0AMf9EgwtJMSH5yLjLOk8OfoR8WpsUpDCbJRongiji4EYehIIq61l/wacVCaShEmuAN5b8mZSQa7hb0qenI9HcWLCXpF3a962MMCW2V8F71w/7vFfYCtjDsGxfZVra4zwjoPLFazGLRYyP7NYuHZMtsdsyjt01HR75NCOVc+DYJVKdwnmUoP9DTcMYgPbwUDFfw77dbtXDyZaNqfuYaswC1a7sHbizni7nc4v0SyURK12dinaDd1RqZJfBqKgINi3h+ohaiHmzD4d4lb4lSPHsdbvFnDin4MZLSBh17rl+Mwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lvVafoRX8vPZ2eS0Dmjp6cN1kkX9LXDwEmEESgb0mvk=;
 b=m3fcIeDT9E/iii0+QjNNaB4n2TEsPfM6dkDASzVb89EA9ilfiJ/KDX1HiIaSsewAutSvakFDfpAAhcsotvy7WrDzvKda8ew7j7+o2+ts0eMsBnRaVggt9S18Hyuz/ADudixaxgQZVxp3JcET2Vf5UuXGlpOf9YXeOAzeeWU3QkNkDXUvMkupX0eUATq7f5qil7eaEGUL3JCqsypwXL7gerd+YmBb9KLdShnwLHD+Vp+cwI2EtmHIYgRRD3NyV4ZhoQiD4zfWOo7AyrRqjooxTu3wtSXj0nvPpqfuRU6RhP3ADTW5vq+GA6yknMuE7D/yHunrY9P1l0a7d82PWZR55g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
 is 151.1.184.193) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=asem.it;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=asem.it;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvVafoRX8vPZ2eS0Dmjp6cN1kkX9LXDwEmEESgb0mvk=;
 b=Ad3H3RNa0qirorEJ3O9AiAcmIIeu1+JqAgYEZcHMKuqen2O5im8Ec07KUVdwfsNnwblVJAUKNKRPBIX1oq658zNu2+pnK0yyJuwNUu5y0tjZ47QIW04wAEnjbJyREc7+/4xbDGOPQZ/uEg11QTP2Y5Dirb+BRBLXb8rnPpmS6i4=
Received: from AM6PR02CA0015.eurprd02.prod.outlook.com (2603:10a6:20b:6e::28)
 by AM6PR01MB4961.eurprd01.prod.exchangelabs.com (2603:10a6:20b:30::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 14:40:11 +0000
Received: from HE1EUR01FT026.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:6e:cafe::1f) by AM6PR02CA0015.outlook.office365.com
 (2603:10a6:20b:6e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 14:40:11 +0000
X-MS-Exchange-Authentication-Results: spf=permerror (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; vger.kernel.org; dkim=none (message not
 signed) header.d=none;vger.kernel.org; dmarc=fail action=none
 header.from=asem.it;
Received-SPF: PermError (protection.outlook.com: domain of asem.it used an
 invalid SPF mechanism)
Received: from asas054.asem.intra (151.1.184.193) by
 HE1EUR01FT026.mail.protection.outlook.com (10.152.0.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 14:40:10 +0000
Received: from flavio-x.asem.intra ([172.16.17.208]) by asas054.asem.intra with Microsoft SMTPSVC(10.0.14393.0);
         Thu, 16 Sep 2021 16:40:09 +0200
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH v3] watchdog: add new parameter to start the watchdog on module insertion
Date:   Thu, 16 Sep 2021 16:40:01 +0200
Message-Id: <20210916144001.1713508-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Sep 2021 14:40:09.0689 (UTC) FILETIME=[BFD00C90:01D7AB08]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 377bf369-0e19-4ba4-9e6c-08d9791fe309
X-MS-TrafficTypeDiagnostic: AM6PR01MB4961:
X-Microsoft-Antispam-PRVS: <AM6PR01MB4961ADD8E2478D64EAE71667F9DC9@AM6PR01MB4961.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VnJ8LHhmyDudXLwxql3N72AIx7LRtNMW4PnltXJjfQ9jLBYCPiT5ONJMhC3pCsZw1GGEfzbDSmG+epSnUgEHYebmIKAm6ljbklkHnR4vL3SKB2NB2c+w/rB8aw+JPomSoZfIJ+oNE9pLjLB3l5wQtOOKA49P+YThNrjS9n8fQS0fVKwDhc9YbTJeklaXkmeTpBS4rXKom9vnRc1HzlZf4sCMPxK94BObPWNY3Cca12/nN05CxYbtsIO/NOC3oLlnZSF7F2SUzWwLVUvkMPOoivSetO2rg3iMW7Axk3a+09Uxt5F0vUil7V8YgsB1xiLaE3zZ17Zr153Q1DtdKBc+Kr2xIWUcpD+mpiFMJDX4cxZUu+T/QqZR+s+MeLnBw3CTPQKgye7+1hmV/EbEBBL5GGdFqZiA2d9ISpGX6lhiTZKuu9vg2vjBqkADyzZgeG7slMQuAfRJSpXvZdopoIKNEXErw584FjATDQhxGuAsJ87Dwrmkd6b/X+IRSb/jbMntpkHuph5UMBXM/Y/GS5wY5ZfiLTpQr6S726Xyi/4nQCSpPAhAmtU4gFPtg5ooNsTf3kNxQLky+Mia6wx9sfYyE9HfIAv5m/2YAx7UcOScpU/OtZNUFoyVDHDRlnGBwuK1amX/x2h0lqLuve3VfCIr4LZu55md3zGCKk2tuLtSBXeWNrReRzgyR7RMlNYkZh+vipFzmIOIowX/Ju4H5KwNibGLI1mVDkLNl8ULf0GC2aU=
X-Forefront-Antispam-Report: CIP:151.1.184.193;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:asas054.asem.intra;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(39840400004)(376002)(346002)(136003)(396003)(46966006)(36840700001)(356005)(83380400001)(47076005)(8676002)(81166007)(186003)(478600001)(86362001)(82310400003)(2906002)(8936002)(6666004)(36756003)(2616005)(4326008)(70586007)(70206006)(316002)(54906003)(450100002)(26005)(110136005)(1076003)(336012)(36860700001)(107886003)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 14:40:10.8002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 377bf369-0e19-4ba4-9e6c-08d9791fe309
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2;Ip=[151.1.184.193];Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT026.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR01MB4961
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The new parameter "start_enabled" starts the watchdog at the same time
of the module insertion.
This feature is very useful in embedded systems, to avoid cases where
the system hangs before reaching userspace.

This feature can be enabled in the kernel config, so it can be also
used when the watchdog driver is build as "built-in".

This parameter involves the "core" section of the watchdog driver;
in this way it is common for all the watchdog hardware implementations.

Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
---

v3: - add check for the returned error of wdog start function
v2: - check WDOG_HW_RUNNING before starting watchdog;
    - remove useless comments in commit text, watchdog-parameters.rst and
      Kconfig;
v1: - first version;

 Documentation/watchdog/watchdog-parameters.rst |  3 +++
 drivers/watchdog/Kconfig                       |  9 +++++++++
 drivers/watchdog/watchdog_core.c               | 16 ++++++++++++++++
 3 files changed, 28 insertions(+)

diff --git a/Documentation/watchdog/watchdog-parameters.rst b/Documentation/watchdog/watchdog-parameters.rst
index 223c99361a30..7780d0c1fb4a 100644
--- a/Documentation/watchdog/watchdog-parameters.rst
+++ b/Documentation/watchdog/watchdog-parameters.rst
@@ -21,6 +21,9 @@ watchdog core:
 	timeout. Setting this to a non-zero value can be useful to ensure that
 	either userspace comes up properly, or the board gets reset and allows
 	fallback logic in the bootloader to try something else.
+    start_enabled:
+	Watchdog is started on module insertion. This option can be also
+	selected by kernel config (default=kernel config parameter).
 
 -------------------------------------------------
 
diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index b81fe4f7d434..19be709e01ac 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -47,6 +47,15 @@ config WATCHDOG_NOWAYOUT
 	  get killed. If you say Y here, the watchdog cannot be stopped once
 	  it has been started.
 
+config WATCHDOG_START_ENABLED
+	bool "Start watchdog on module insertion"
+	help
+	  Say Y if you want to start the watchdog at the same time when the
+	  driver is loaded.
+	  This feature is very useful in embedded systems, to avoid cases where
+	  the system could hang before reaching userspace.
+	  This parameter applies to all watchdog drivers.
+
 config WATCHDOG_HANDLE_BOOT_ENABLED
 	bool "Update boot-enabled watchdog until userspace takes over"
 	default y
diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdog_core.c
index 3fe8a7edc252..cb530b097223 100644
--- a/drivers/watchdog/watchdog_core.c
+++ b/drivers/watchdog/watchdog_core.c
@@ -44,6 +44,11 @@ static int stop_on_reboot = -1;
 module_param(stop_on_reboot, int, 0444);
 MODULE_PARM_DESC(stop_on_reboot, "Stop watchdogs on reboot (0=keep watching, 1=stop)");
 
+static bool start_enabled = IS_ENABLED(CONFIG_WATCHDOG_START_ENABLED);
+module_param(start_enabled, bool, 0444);
+MODULE_PARM_DESC(start_enabled, "Start watchdog on module insertion (default="
+	__MODULE_STRING(IS_ENABLED(CONFIG_WATCHDOG_START_ENABLED)) ")");
+
 /*
  * Deferred Registration infrastructure.
  *
@@ -252,6 +257,17 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 	 * corrupted in a later stage then we expect a kernel panic!
 	 */
 
+	/* If required, start the watchdog immediately */
+	if (start_enabled && !watchdog_hw_running(wdd)) {
+		set_bit(WDOG_HW_RUNNING, &wdd->status);
+		ret = wdd->ops->start(wdd);
+		if (ret == 0) {
+			pr_info("Watchdog enabled\n");
+		} else {
+			return ret;
+		}
+	}
+
 	/* Use alias for watchdog id if possible */
 	if (wdd->parent) {
 		ret = of_alias_get_id(wdd->parent->of_node, "watchdog");
-- 
2.25.1


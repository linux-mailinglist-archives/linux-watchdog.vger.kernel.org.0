Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4774D4175F7
	for <lists+linux-watchdog@lfdr.de>; Fri, 24 Sep 2021 15:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345834AbhIXNgt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 24 Sep 2021 09:36:49 -0400
Received: from mail-eopbgr60080.outbound.protection.outlook.com ([40.107.6.80]:53974
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1345090AbhIXNgr (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 24 Sep 2021 09:36:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nffHqalN/pJ7h7evfQM5NfwoqKhQjKtRchZKyoslZikY0m/Q2iLJhf3KUkth+HcwRYVZxBPjLKiRENCnvs+xOoqpUGLb5BIbHZVH10PW+HDM2TqSOW5nMEtvvB3NZE/WbprZ+mZhywGV9FXoue8Jkfd3nytTNnZmwGEu71PvQxM4VApM89tyHYRJCCooA+6PxuRoyO/TmjH+84/XjGM3wojBKWVwVx522Xwo5yqXGyGdPfco6jtjXlRxqzuZsw76XpLbPjaWmo2yxhyFxPijqVJaokgKMol5+C1cNlni2jDDmCYvMYI231kkazdNMWf4rNezkuQpB8IM2YqXJBpAVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Naov/ZTvvVxu8nFIFtzHWOmTPwirURMM5djoVOH3uwQ=;
 b=icWFaq1xN9yl+P9TaJzqAQM/nBrlklVJ70WM7ZTua/WVW6M+cehZikK8+tKcKGuO3uTzGNirPadO7EBDdoPiid9eDKEoxyPp+fEzTcjCUSr+qIDku9ReVSanTOPm4MIqtsFniEw/jGhx40P1Elcl5v7xPCYVcsQogjpbK1I8tlGbfzanZiM/AlBG4FlEui7fNOMaioyb/lsvDMu++iGg2QE+ful8h5PEpJM3vY2YPOGAPyc/WraryViL0CZP/PV/iNcbnQSs8F9TNca49yWVxo2Hy46Z6tJCeb3ItnzATs7eI2izNlwC7fyWq4alb4yKq3nhpS+zr5MKn5UzDkpBYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
 is 151.1.184.193) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=asem.it;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=asem.it;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=asem.it; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Naov/ZTvvVxu8nFIFtzHWOmTPwirURMM5djoVOH3uwQ=;
 b=AASzc+6e1ZRy6c4iCKXDE5GM7lhmnZhBJdY0olRWHGIidfFL8EuEnSzZe8tB03q3vitP0OKnNcI3yT3r7yZYTwsnVZkyLhuLyM2UyF3L0D2wdOtpgH7cPxji1I/QLkDkn0DKtITCgxX13q/hT2yumCp7w98R2xB29Ij6EqtGHhc=
Received: from DU2PR04CA0279.eurprd04.prod.outlook.com (2603:10a6:10:28c::14)
 by PAXPR01MB8301.eurprd01.prod.exchangelabs.com (2603:10a6:102:214::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 24 Sep
 2021 13:35:12 +0000
Received: from DB5EUR01FT061.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::b3) by DU2PR04CA0279.outlook.office365.com
 (2603:10a6:10:28c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Fri, 24 Sep 2021 13:35:12 +0000
X-MS-Exchange-Authentication-Results: spf=permerror (sender IP is
 151.1.184.193) smtp.mailfrom=asem.it; vger.kernel.org; dkim=none (message not
 signed) header.d=none;vger.kernel.org; dmarc=fail action=none
 header.from=asem.it;
Received-SPF: PermError (protection.outlook.com: domain of asem.it used an
 invalid SPF mechanism)
Received: from asas054.asem.intra (151.1.184.193) by
 DB5EUR01FT061.mail.protection.outlook.com (10.152.5.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 13:35:11 +0000
Received: from flavio-x.asem.intra ([172.16.17.208]) by asas054.asem.intra with Microsoft SMTPSVC(10.0.14393.0);
         Fri, 24 Sep 2021 15:35:11 +0200
From:   Flavio Suligoi <f.suligoi@asem.it>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Flavio Suligoi <f.suligoi@asem.it>
Subject: [PATCH v4] watchdog: add new parameter to start the watchdog on module insertion
Date:   Fri, 24 Sep 2021 15:35:09 +0200
Message-Id: <20210924133509.3454834-1-f.suligoi@asem.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 24 Sep 2021 13:35:11.0218 (UTC) FILETIME=[FF729520:01D7B148]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5eb2f7c0-fcb9-47ed-d222-08d97f602265
X-MS-TrafficTypeDiagnostic: PAXPR01MB8301:
X-Microsoft-Antispam-PRVS: <PAXPR01MB83015AF1E65CBA761565655EF9A49@PAXPR01MB8301.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ePYNND2h0o9V52XAGf5V+aRJgvtf4Q4X7qnkfIFKrR35hBVDtBCon4MrYgQ90T/Nen4pEFbzwQBq1VSwBbXt9CaevtYwteHfwc/1bluCJ2ONAkUYFzjeETS4jSdaFuXUFjHCuX0/5HBJovLWbsHkERtKqfdsZaS+/wegwzcBuO34h5Cyo80K6KoqdGP6qVlSUddSdMC+9iZ/o432YEbKDPv/pZ+sjyT0ZzWc4XnwDSligiqqnmGT3l+4aWG/mm9WFw+XWdQvDavVj5a3Vz4EWPoZhkybG1ULDRoRn2RIZxOHLQxVXAYhsZTVe/UVZNfaV/MhRihBED3fgVFaZbB54xf5e8UhHiu2vE/bUVObdDvAUHYOTxXG1iFrFLeBe2Hak/S4I9AL7SsmGNt0b52e80T+8sqNP/XG3q+Hz1OdktPs9J+MclUbabmpBPB3lVn0zVwcE6M0r8tpcRpobY5CNhKrzV3+lvryjP//pNJfBA20BPzRPbnV0li15pxtalwnowvIyrC8w+5BPQQOMM0bEgZRV83bVEUxvZ3sA9Zg60uGuMwpxxE92Mpo7v0yIqP1fxf4S6Tusp5SZWEIPjEiNPk6KT547usu767KWCkDvfcunaU2wAyOvFKqJ63561omDF3tm7zj7x9PPUUso/ze2287yCa3QYj0kxEi5oKbkcbTWJbsbeqjl/4blY+/eKaZcHhsipvWL2353VEFf+/qbtjsF8ah3F0gR4KxjVX9eVU=
X-Forefront-Antispam-Report: CIP:151.1.184.193;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:asas054.asem.intra;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(36840700001)(46966006)(47076005)(8936002)(316002)(2906002)(83380400001)(86362001)(336012)(2616005)(36756003)(26005)(1076003)(450100002)(508600001)(54906003)(5660300002)(186003)(8676002)(70206006)(70586007)(107886003)(110136005)(36860700001)(356005)(82310400003)(81166007)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: asem.it
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 13:35:11.8822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb2f7c0-fcb9-47ed-d222-08d97f602265
X-MS-Exchange-CrossTenant-Id: d0a766c6-7992-4344-a4a2-a467a7bb1ed2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d0a766c6-7992-4344-a4a2-a467a7bb1ed2;Ip=[151.1.184.193];Helo=[asas054.asem.intra]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT061.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8301
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

v4: - improve code legibility in returned error checking
    - stop the watchdog if driver registration fails
v3: - add check for the returned error of wdog start function
v2: - check WDOG_HW_RUNNING before starting watchdog;
    - remove useless comments in commit text, watchdog-parameters.rst and
      Kconfig;
v1: - first version;

 Documentation/watchdog/watchdog-parameters.rst |  3 +++
 drivers/watchdog/Kconfig                       |  9 +++++++++
 drivers/watchdog/watchdog_core.c               | 17 +++++++++++++++++
 3 files changed, 29 insertions(+)

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
index 3fe8a7edc252..d9211fea45d7 100644
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
@@ -252,6 +257,15 @@ static int __watchdog_register_device(struct watchdog_device *wdd)
 	 * corrupted in a later stage then we expect a kernel panic!
 	 */
 
+	/* If required, start the watchdog immediately */
+	if (start_enabled && !watchdog_hw_running(wdd)) {
+		set_bit(WDOG_HW_RUNNING, &wdd->status);
+		ret = wdd->ops->start(wdd);
+		if (ret)
+			return ret;
+		pr_info("Watchdog enabled\n");
+	}
+
 	/* Use alias for watchdog id if possible */
 	if (wdd->parent) {
 		ret = of_alias_get_id(wdd->parent->of_node, "watchdog");
@@ -356,6 +370,9 @@ int watchdog_register_device(struct watchdog_device *wdd)
 	mutex_unlock(&wtd_deferred_reg_mutex);
 
 	if (ret) {
+		if (start_enabled && watchdog_hw_running(wdd) &&
+		    wdd->ops->stop)
+			wdd->ops->stop(wdd);
 		dev_str = wdd->parent ? dev_name(wdd->parent) :
 			  (const char *)wdd->info->identity;
 		pr_err("%s: failed to register watchdog device (err = %d)\n",
-- 
2.25.1


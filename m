Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE3B379D55
	for <lists+linux-watchdog@lfdr.de>; Tue, 11 May 2021 05:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbhEKDFB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 10 May 2021 23:05:01 -0400
Received: from mail-eopbgr60087.outbound.protection.outlook.com ([40.107.6.87]:26753
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229736AbhEKDFA (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 10 May 2021 23:05:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIXqe6OtqE5rjsGOjuClDwoD5JAI5nOSy8W58ovwOBvBncJrpGX5dUU7aJUDxZ+QsXXT9fYrUhcmmC4m7FczF0ZQ5QzgNjMGiYx9AVsa5O7ojNVO14Dfa4r+HrbIldb6yANg3GmU7BXSOpL3AGkPX4P7mhp+ODEZv0Asx+eXZOSrFc4HCm386KLLqwLB910ugco8Jc+TOkyN2MHeoBXHFIoKDIerlDMuF+wv7WAEiIlB8jpKKOxRwFemjGA4r066I+4eOHwpT5OAmZn8c9wgs4vyW116zeSMBHaG+Pt56lzcD7oGSvvXDvTpNqe95uABmnloUaAprF6Jrlk+F33e+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCNDCRU0T+rg8PLRHW8CUxI5ByJVM+n0Uq7O1pRdyYE=;
 b=GAnDif8vBlDJPv/UQBg3RfZSY7Y8nYRc5DtAlKnz7Fe2JyfjCoAaEHuMsRB7wfdLhrv1UVtqh2pdkY9FDpKUYOjB5mfzXFUKQXWwhZMpFKx2JlUGFUuZn5JsHS0IJhZbZZHQCbZ/kfkILzRVWXAoJ49Inehg3d+7C9DaX9Q68u0iwAE9S/y+7kFAfQZXKDbjgGxupL/ltxqBOFq2/BzoG1FyH1NWPjajs5J2+xU4cYQsQYtQetqTGs7eoFmMJoSyDYrDRhlsGEsbOdu5PGvaK4yzoHJPaNuLqVLW6eCKi0QljVBjMcmftwByHZh8gK6a1xpFyeEs0NdTwmGuvsH5dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WCNDCRU0T+rg8PLRHW8CUxI5ByJVM+n0Uq7O1pRdyYE=;
 b=jIiqZ8h9Nv+p45JSmSw62Z9U36KEwGlNYLt9mOinThhzE4gNKbSeEHlC7u9Crq8k+j58ypvsa15cx8iyWljlaparwSDbLXXHUhvd0Ea3Z1m/6nmPKplWyAcziCY5vhc6zPNOXJk2N75Y6Xn/lGFXWe73BYhoY/RQZnm/iHWAvUg=
Authentication-Results: linux-watchdog.org; dkim=none (message not signed)
 header.d=none;linux-watchdog.org; dmarc=none action=none header.from=nxp.com;
Received: from VE1PR04MB6688.eurprd04.prod.outlook.com (2603:10a6:803:127::25)
 by VI1PR04MB4559.eurprd04.prod.outlook.com (2603:10a6:803:74::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.26; Tue, 11 May
 2021 03:03:52 +0000
Received: from VE1PR04MB6688.eurprd04.prod.outlook.com
 ([fe80::de2:8b2:852b:6eca]) by VE1PR04MB6688.eurprd04.prod.outlook.com
 ([fe80::de2:8b2:852b:6eca%7]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 03:03:52 +0000
From:   Robin Gong <yibin.gong@nxp.com>
To:     wim@linux-watchdog.org, linux@roeck-us.net, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com
Cc:     linux-imx@nxp.com, kernel@pengutronix.de,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1] watchdog: imx2_wdt: clear WDOG_HW_RUNNING before suspend
Date:   Tue, 11 May 2021 19:20:32 +0800
Message-Id: <1620732032-7675-1-git-send-email-yibin.gong@nxp.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::17)
 To VE1PR04MB6688.eurprd04.prod.outlook.com (2603:10a6:803:127::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from robin-OptiPlex-790.ap.freescale.net (119.31.174.66) by SG2P153CA0030.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4150.5 via Frontend Transport; Tue, 11 May 2021 03:03:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f159e6a-840c-4656-d313-08d9142967b7
X-MS-TrafficTypeDiagnostic: VI1PR04MB4559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB45599C2735F7D5A6FF169FBD89539@VI1PR04MB4559.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K1u3ZN0c83PyEmkHX2JIlPkAcT51IkKDhX/ZMOX3roPpTN47/c6Y15sh5uEwVhmiPSMjHCdi/EEK9iaUiQjKyLQG1q9fdwXzwEhvhYwG2Km8vX1J8tWem6ynP4G2H9z9Lpy/VUd7uVKNYzu8f5h0iH+mUM6Grx49QoPimGRalIDm+AQfKXCZOT+kFKZmZ39LfKHLAPSe5O7UUW9jxKo6QS8oCCIj/2qSPk0YYV+YLOHus6OoJdpXeWf05Tz1HsxpVqb+Mja/HVWLqeFwMKd1BT/YzEje2EJSUj8djOdAsXIpRFjXVnG8mUelpe0phCRvw8P/FME+6JUasr79BTcvvt9ABMvk+Q/YyJZHjqVZ+MtDFU6D5utNpOb5pqB3tcpIq1vzQ61KTZ8Eddo8j+E7RW4WT651rSCUk6x6CTMUaPypjgR4vjSX04e21FyN1QPKnCIe3cgdhD/TEx4Dl3feBkDm1J8LI3w+HnWM9n9xXoeOCyJvOltrsyYig2V/trhIMZjolgWl0RzT1sUQDuVQ1eaXc0Ho+El/8HrkcpwlAUuL4v5kX0CaTkHssNWOt/DfsfB3sTK+xWCU/X+cTB/CkYmCRMof0RMYY5ELgDLEpX5og0qv+MjdqVsFdiXmJcLnxD4ZJPBZ6WLVXkdjQSVBWrepqfw8jISWPUKPNcMuWzc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(136003)(376002)(366004)(8676002)(2616005)(478600001)(83380400001)(316002)(6506007)(16526019)(66476007)(66556008)(8936002)(4326008)(86362001)(186003)(956004)(66946007)(26005)(5660300002)(6512007)(36756003)(52116002)(15650500001)(38100700002)(2906002)(38350700002)(6486002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vkJ5g6MNLJeAdNOccl3hakg9Zp8wQ6joe+HtQ4xTWW+W0YGF1hpsX31qpltp?=
 =?us-ascii?Q?4y5idTHOULtih8pH/3DxgU49Nkocv2vO0bUMLd3yWYt2WUEP0tbqO7aM8P4m?=
 =?us-ascii?Q?tW25g3auTGzt0J3YA/z0RUKxzhsWYCUuOan0QeSJBu1boB2bkpBnNxWby+kD?=
 =?us-ascii?Q?UWzRl/D9ckeQI1mjy80V0urE836Qo0EJLDfLZJa3mPtZXtT8OWppWsGgTBrU?=
 =?us-ascii?Q?1UOMo3eHT/R1dXAsb1bcaumB4FLGz3Nz2TcJg8SUryd6Szjvd3FaKnBck2lU?=
 =?us-ascii?Q?E8hws3ZwrFBSHQSVVfDsNdCEi2R7llRttNYoully3qm/7Co15JrEAU1aoFP2?=
 =?us-ascii?Q?XZtc1A+oKTSTedISlQ+BdVSS3I2vT5NkjSBgV5z+8UEkEyiFxP/f2hgEPgXE?=
 =?us-ascii?Q?DYGukCfynTUp/8X0iJ6ga3CvOzkF6zozi5kJvcgahE7KVWC4D6HwjQ4r20pi?=
 =?us-ascii?Q?aRm8YSPaMOPsUcHAbSmO/HDUQtt1mO8SI1z/pQ7IswpyX865auNNToxmHHEo?=
 =?us-ascii?Q?qTGsRr3pfhv4ZH+QRMoZcujIBT+7/bI6ac5LWyoj56iPXTFV2fAGOptNCP9l?=
 =?us-ascii?Q?an2rmH2KhYK7Fxi5SV7e1dbzUMEsvnaowutG07YXY29IuryXQzy3t9S5EPLX?=
 =?us-ascii?Q?LFI9h0PTd11+SgLHlImN1MLsYbrzdJ+l8UKnOXQctplDCx0R3itCNW/biZO5?=
 =?us-ascii?Q?9lQj+NHwnHQdPWMMe/8rdSZkQ3ByX4Ool+cQroaHb59IlL7NonD0AqT3XzAQ?=
 =?us-ascii?Q?S8mV/4DuQH9vVUiGgguPEf87F7R28CQcPv5Z+djShthg+7DchAidQ/Y+bWwW?=
 =?us-ascii?Q?q79ZU1ImPP2pZi80Q1aOrsnBsJvZrVFsDqUgCI3ejcs4OD9ffsPWT9/zjRyH?=
 =?us-ascii?Q?+y7AVGLsTN9apY3bgYDV8MYtqMcI7y/7GY6pwDFnZU5lF5OAsGlYvDQacuy/?=
 =?us-ascii?Q?SbL+iE++QkUdWMO0jQpTJ+KTauc5PF/UfTnVg8yurB11NwX0aUzyt381fHn5?=
 =?us-ascii?Q?9v5ztohUSUJ2ksT3Bj11acXgNUnL53ZI3OXhaEV3khnQYRhOGCJ8dm8RCbCF?=
 =?us-ascii?Q?4dZSAnA1EcFx0zOETPs/DrBohsrZQ55GYWEJyi/8uzK3HDpeoiWY9t6cmi4r?=
 =?us-ascii?Q?BrhPbQHZUH0lf12n+cZFnb8neDwfkzvCOojH5KoB6Q6HPB7AzyB5wj0jgRZe?=
 =?us-ascii?Q?TjqwJKWOmoLyaEBClV0hwx6XAHRxKdSSW6Num8XmmapFmlCY89Ai1FRIyAV7?=
 =?us-ascii?Q?4s2uhpkxpnZWb34Inv0krSq2Kty1X3ngU3RepR0JnA7YQ4kw81/s9daP/qT+?=
 =?us-ascii?Q?U451RQChPIM3QLgJGeT9uLkx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f159e6a-840c-4656-d313-08d9142967b7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 03:03:51.9328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BML+wBFUe1E9f6WCTHu/Dp+yQ4dAhCuc7Vthvgh+0Uit4XtnxtBbxRW9nsMBikC1Nwca9cermeDnG4LVJjLtOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4559
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Since watchdog_ping_work is not freezable so that it maybe scheduled before
imx2_wdt_resume where watchdog clock enabled, hence, kernel will hang in
imx2_wdt_ping without clock, and then watchdog reset happen. Prevent the
above case by clearing WDOG_HW_RUNNING before suspend, and restore it with
ping in imx2_wdt_resume.

Signed-off-by: Robin Gong <yibin.gong@nxp.com>
---
 drivers/watchdog/imx2_wdt.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/watchdog/imx2_wdt.c b/drivers/watchdog/imx2_wdt.c
index b84f80f..d3751e9 100644
--- a/drivers/watchdog/imx2_wdt.c
+++ b/drivers/watchdog/imx2_wdt.c
@@ -357,6 +357,13 @@ static int __maybe_unused imx2_wdt_suspend(struct device *dev)
 		 */
 		__imx2_wdt_set_timeout(wdog, IMX2_WDT_MAX_TIME);
 		imx2_wdt_ping(wdog);
+
+		/*
+		 * clear WDOG_HW_RUNNING to prevent watchdog_ping_work running
+		 * before imx2_wdt_resume where clock enabled, otherwise kernel
+		 * will hang and watchdog reset happen then.
+		 */
+		clear_bit(WDOG_HW_RUNNING, &wdog->status);
 	}
 
 	clk_disable_unprepare(wdev->clk);
@@ -386,6 +393,7 @@ static int __maybe_unused imx2_wdt_resume(struct device *dev)
 	if (imx2_wdt_is_running(wdev)) {
 		imx2_wdt_set_timeout(wdog, wdog->timeout);
 		imx2_wdt_ping(wdog);
+		set_bit(WDOG_HW_RUNNING, &wdog->status);
 	}
 
 	return 0;
-- 
2.7.4


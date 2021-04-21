Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6026E367016
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Apr 2021 18:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241431AbhDUQ2I (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Apr 2021 12:28:08 -0400
Received: from mail-eopbgr30050.outbound.protection.outlook.com ([40.107.3.50]:17033
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235040AbhDUQ2G (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Apr 2021 12:28:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAvewtCn40snm1ZszJUHP+iT6DrKUa+18i5WVrJYWwT/i1c7ooqHBiWAJxqt3WzWBctjgX3yLvAtbbeyNQAJGJqutObpFyP/1iGDnHGLimjm+17Wqs1hCVPMlwoobprVRL4i5HiXLalieDxj7dHo83PaaAHWQfGVUc/he3F2YPteManszHZk6gSPg76TjcgruDBrM7mnMw4z5W27CXU7ETdaRlrd6/6yB3n+Z6xJZBRyVN9JgKmSdqPnDHvptiP3DV6++f01+p3rWWZ+eJmEGcnhjhC+nSGq/lzDByVnnAmzZFIowkNPKmmMyBAvlcimrBpAonsOyrQxcTqvhgv9Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GsKP8qJ6Gm9o2MwL6VUY97aeSFt11pHuXw4dIeYPJs=;
 b=E2CRrkw3JQx3VyKRBfRjzwsdlVJ1PmczqjK9hvclcfVaeub8W1iAOjpbp5V37Pvi9qYlYlNRmbL/z40fvYRzPVoGyDUgo2q2VlPE522SuvHaicqI1k7xdWandHjUs/OsOabs4tr8zbe9t3g/iFDfETd+ym6dRSPJ+7NgFGvIQm17brhCFbbArpjrQtT7l83M/dEXMlVcqHYqQ2w9YUgBCe+jmS85fbMB0o8JyrjCyf/V6+H9r7oziJrx+1dYA7/ZDarK+l6/F1IWeNKJcZvpF0CAnjLF4eDGgzIaHCKGHBUXkkZg8ik+GsSZeRRVhAmtLOUEnrEe7VDiPgQ5ekUi0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Vimargroup.onmicrosoft.com; s=selector2-Vimargroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4GsKP8qJ6Gm9o2MwL6VUY97aeSFt11pHuXw4dIeYPJs=;
 b=G0kBhHDgfzHh60pl97VtkOYIgwdlShvhn9tIQFPiEkIAJjy/tvID69lHz3PiJa9pOi2tc9MGImVChAwwfIR8MKpCeyIEwCNLEJdi2iQJQ28X79Zd6Rw/DuXHiTHJiT+/Tg0xtyPqOnWhRB/wEqcHXQHNwZZX1M+nF6nanx6bMYQ=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=vimar.com;
Received: from AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 by AM6PR08MB4533.eurprd08.prod.outlook.com (2603:10a6:20b:b5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 21 Apr
 2021 16:27:31 +0000
Received: from AM6PR08MB2981.eurprd08.prod.outlook.com
 ([fe80::9de3:7ce3:f155:8eda]) by AM6PR08MB2981.eurprd08.prod.outlook.com
 ([fe80::9de3:7ce3:f155:8eda%4]) with mapi id 15.20.4065.020; Wed, 21 Apr 2021
 16:27:31 +0000
From:   Francesco Zanella <francesco.zanella@vimar.com>
To:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org,
        Francesco Zanella <francesco.zanella@vimar.com>
Subject: [PATCH 2/2] watchdog: gpio_wdt: add "start-at-boot" feature
Date:   Wed, 21 Apr 2021 18:26:21 +0200
Message-Id: <20210421162621.24910-3-francesco.zanella@vimar.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421162621.24910-1-francesco.zanella@vimar.com>
References: <20210421162621.24910-1-francesco.zanella@vimar.com>
Content-Type: text/plain
X-Originating-IP: [151.71.13.13]
X-ClientProxiedBy: ZR0P278CA0052.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::21) To AM6PR08MB2981.eurprd08.prod.outlook.com
 (2603:10a6:209:44::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (151.71.13.13) by ZR0P278CA0052.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 16:27:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d49d366-d9a1-4882-2174-08d904e25cbf
X-MS-TrafficTypeDiagnostic: AM6PR08MB4533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB45338F783A728AEFCE38B995E9479@AM6PR08MB4533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wg3EPbkVuKYzHUn0SbRkoCOPoV6J7IldANrQ05Yk7EJHhHGLzYoKNAqCGr6W625VfcKfw3buY6oWUEMOd0/5qsz90vBLRbMmLQD4jc758ubpWMvsYn9FCwgDX7CSLhZkcKWaE7RfC47nS6Svak30YbQgxPjbdXFu0sqjHWYVvIWRAe8XgCION4+cfnCIZQDRQX/nD87kZpt3xx79LOHPxhN5MTS5DesTRXShW2nBH0wdNv9xpsyQFTg5lCZ+u8D2OiVfOtmHQgiwM867D95/X3Re3ykSBInH8TnXuHf8hef1OKRXJdaJLWJygc2wFoW7ZHgYThF7tYTp8HsEWJ3HIK7F6zkEAukYtuyKLQNNILgK8dLyg9qnCN9g54yqpbMQlwzc4RBtqO5N9IG9yOpOE64pRy5l9MCGtJYeq+euwBFFsLpg5hh4ljtTUEoGi+/lhbVOJhBB9CUg2sTsg6h1LlNCLZWHU1/gowmoSgVpfE2/5qy9ueOr7uOFwrNPzIIsiMdtXhe45hPS3WPEjphpX6Xfosc5W+TzoC5+vrKl8Pj0mFpXmiHzBciBmfAiv8pCUlL4nly+zq0ppn6fyG+2KDM/sw5KDGln0x6zmrnRwc5pqsa3XjWDTzPQvDb7uS6Q+P45cOuli2y4tG+/KoJa0TMCQbRitqkIUCCXFsMUuPvmWRcrAjjc6KzFZGtHVaMu0Q6ElD3eM9wiJgaN0XuwRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB2981.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39840400004)(396003)(376002)(366004)(86362001)(38100700002)(66556008)(44832011)(6486002)(8676002)(2906002)(38350700002)(4326008)(6512007)(6666004)(478600001)(83380400001)(107886003)(66946007)(66476007)(6506007)(1076003)(5660300002)(186003)(8936002)(16526019)(956004)(26005)(2616005)(36756003)(316002)(52116002)(69590400013)(6606295002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?P9fhEw/bz5/dRxDYyYkfcbaz+HQkXBKyP+bCbXwuCNKPq9YCg1hhl/pPrK/S?=
 =?us-ascii?Q?MMFMGo966+VUI1cYWC4FUU1gK6Pe7daO8i08SMWemqDsnIScLZLpEkEtGK0P?=
 =?us-ascii?Q?0RAeu9IBm55XijmJtOUqAStpQMLgPswy5yH8KSmwzz8u3UsJ+tf6CNXS3UBt?=
 =?us-ascii?Q?zykzatroVUYW2puGnVJehQjeU8Kj46BkfwGL/V0WYLrytMINtzcjPL58uh4Q?=
 =?us-ascii?Q?bk55E1XSUDuvvAIvOI1pKEImaYTiK08BJw+kBIV0oqKa1bzseXr4Uu4qz+Mv?=
 =?us-ascii?Q?PAiLgwRDMOyptuSO/I4e+4MoayG1nvV/lKI10W3Gcs1hl49m1SOS5vJXepku?=
 =?us-ascii?Q?k+6cpiNOaRqrVT4zFQcHRevp3BXQLshehauDYONNtFAFQpOMtABkFJQnBOud?=
 =?us-ascii?Q?2K0p20xQ/l3Caj0NdYBeBBKi1h7oVLgnAL23DPF2Sm/Rs8VLrk6g0JBgRXgm?=
 =?us-ascii?Q?cnG4t7vnaeuJW8KLASwxhpNltFwmLsSJUVH7fShlsfZrnxdrZLNBtTA0ivKn?=
 =?us-ascii?Q?5dws5vuHaIjJEpOYy7JXT+I96jZgS2iISG22a0cvwUo5h9g6mtyudrJvNShD?=
 =?us-ascii?Q?xrU9EIJENkdOLCKjxuN6+0esAtj1UuguI6kOwaCCpjP3dm+oja+rcyuwMZuN?=
 =?us-ascii?Q?5yVT+sxXhSYXbmrKZjuQdtqfl7eaqEhBDp/G/ClGQu+Hzs8nhjcG8KBcMF1S?=
 =?us-ascii?Q?q4XsIjOkzRccV6Pl1OJfRdF/MZngE/Z1e/Tkh/brDcrpNVfFVJljg6IAR9Kr?=
 =?us-ascii?Q?ZMo6F4zoZDQN8Z1kJeE6bn7eTEHoD7FOP9Ir1iuVeHJ5A8AdiakVVaA4GFSl?=
 =?us-ascii?Q?5+L8oYLeMdHrUjGV9jBt6cztV5AtvZll/xtrQPIGzrPqCgzv7a7ZsiTApQrO?=
 =?us-ascii?Q?XZvUt4girDC7oWJ8ZyIsbcX5YGgngl1/sVSendtmb9t50SzWrEIOTkCRs9Cu?=
 =?us-ascii?Q?oep5wfgAgc6KXMvFlbdoQAZXEnmgiVK76+9CthoT0YaarGGqyYjdM9IopEpy?=
 =?us-ascii?Q?iDxE5nvCoXgdcHHkzr5NrKplvf+r+4dLNy6DJqUX3I0rYzP8ReWd1hcNDyup?=
 =?us-ascii?Q?ysof04lw3xJqvQchb+nptntjroda/kNXktiSa957uliDLsdtmdwx7DY5BmMz?=
 =?us-ascii?Q?nd+3L9W+sGgnmeTg5Hji6F07YqK/31P7doJRcmfvD/tm3CrSa3J4RfSgZve+?=
 =?us-ascii?Q?ap0wRrAjflNilx1p0wafzpSI8i/7MPbLfT56DL4otObecaO5Y4mMLD8QQten?=
 =?us-ascii?Q?ImJsa+dva5BGKE38Nr/qgRxFnwKFLKCDk5qjcKZty/84jjP1/t6idHARkWRJ?=
 =?us-ascii?Q?nq+ZLiFz+QD9CszacfmBA9h3?=
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d49d366-d9a1-4882-2174-08d904e25cbf
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB2981.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 16:27:31.6284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+Igj+hAAmqpZxhV/F3JWyWgkgNPMyKk+K5yvZHGzM1V3IdvyXgXP3qCOSl/vPt0lA6Z+iTGmj3DHgfJXdtD0GJkYqIwAe17uCey6puyPdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4533
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

If "start-at-boot" property is present in the device tree, start pinging
hw watchdog at probe, in order to take advantage of kernel configs:
- WATCHDOG_HANDLE_BOOT_ENABLED: Avoid possible reboot if hw watchdog was
  been enabled before the kernel (by uboot for example) and userspace
  doesn't take control of /dev/watchdog in time;
- WATCHDOG_OPEN_TIMEOUT: Reboot if userspace doesn't take control of
  /dev/watchdog within the timeout.

Signed-off-by: Francesco Zanella <francesco.zanella@vimar.com>
---
 drivers/watchdog/gpio_wdt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/gpio_wdt.c b/drivers/watchdog/gpio_wdt.c
index 0923201ce874..1e6f0322ab7a 100644
--- a/drivers/watchdog/gpio_wdt.c
+++ b/drivers/watchdog/gpio_wdt.c
@@ -31,6 +31,7 @@ struct gpio_wdt_priv {
 	struct gpio_desc	*gpiod;
 	bool			state;
 	bool			always_running;
+	bool			start_at_boot;
 	unsigned int		hw_algo;
 	struct watchdog_device	wdd;
 };
@@ -147,6 +148,9 @@ static int gpio_wdt_probe(struct platform_device *pdev)
 	priv->always_running = of_property_read_bool(np,
 						     "always-running");
 
+	priv->start_at_boot = of_property_read_bool(np,
+						    "start-at-boot");
+
 	watchdog_set_drvdata(&priv->wdd, priv);
 
 	priv->wdd.info		= &gpio_wdt_ident;
@@ -161,7 +165,7 @@ static int gpio_wdt_probe(struct platform_device *pdev)
 
 	watchdog_stop_on_reboot(&priv->wdd);
 
-	if (priv->always_running)
+	if (priv->always_running || priv->start_at_boot)
 		gpio_wdt_start(&priv->wdd);
 
 	return devm_watchdog_register_device(dev, &priv->wdd);
-- 
2.17.1


Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBD9C367012
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Apr 2021 18:27:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240910AbhDUQ2B (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Apr 2021 12:28:01 -0400
Received: from mail-eopbgr30078.outbound.protection.outlook.com ([40.107.3.78]:48894
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235040AbhDUQ2A (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Apr 2021 12:28:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QuuUuy/k7BKECKMc/O4i3qnjxmmrB5P6+yCmPVpSFpe0xfUnJ+obL+B5lSSS25wYPSEnY+JyBmCzcbdgKzNSYrD11cpzThWdVLAsGJlYOOzaxS8Z6HWkPhV11pFR3IsqK5wmR6EguGEnqarnwNl8/QigrewEwxYht7DAo48bSa6jQWH3yHV8GHKbrNBS+VP+8Hxuh18Gz6AmoV2Vbfm9Mm5TN1E61X4/VpK4CVBzyUmRrUPz+S2agav0e2oF2DPiIUyxOsBkOM+j1/X9MaWf7QE66IuK5awKLpP6a6BpskYQzyIhTc4vgDYgBR/oz7wQcZZ7gXAAe64D0Eq9QP5aQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYciNxIuBBOW/4t6c/s/C6RG+KzVU/1lAxXzfg9bgQA=;
 b=U+BJHFb19uMpYiDD7MzNMdOMyQREvVM2FNmLjlhA+l7lHBhWoLjAfXYC4CSEXaP5XxLeAQ8Cr3ZCNBf8dNqjKbn9LcK29haVxXt4fdTGRcE2qxnzv5AVSaU7aX9vZvuYEwvV6/+eFsUrMoWhWLvd3E6X1KE3wIJKm0I3HomZPuOzcja2nkvDYJVBFueJ2Sgt8Qu+0UQorMoANR2lsuWpRioe+9MWgQ1uozSlfEImV31a4ytsGJAhlfTBraYej0cqxTv3zESWZe4+syNjWXPMx98UYY8W2iwXgNUknNH7rrKrGOLxejTtIuHm7mXEsOt0l4dxmy0iwehWhHZ0Hu3XKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Vimargroup.onmicrosoft.com; s=selector2-Vimargroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYciNxIuBBOW/4t6c/s/C6RG+KzVU/1lAxXzfg9bgQA=;
 b=T8Sj9qKeLdNSUHEzPjW9MuEP2L4oEBOknJZtnH7TjQhVQtzxQjhDinbirGR+772vMdBndTR+IfAbkiPk96pdh/Lm1p8fJ9qhV2R2qG54pLwOZumhUBhWYBXIB47A3clMXBA6J8IOF/1PQkt86tzt7OVUABFp6ZKQMiK8rATug34=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=vimar.com;
Received: from AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 by AM6PR08MB4533.eurprd08.prod.outlook.com (2603:10a6:20b:b5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 21 Apr
 2021 16:27:25 +0000
Received: from AM6PR08MB2981.eurprd08.prod.outlook.com
 ([fe80::9de3:7ce3:f155:8eda]) by AM6PR08MB2981.eurprd08.prod.outlook.com
 ([fe80::9de3:7ce3:f155:8eda%4]) with mapi id 15.20.4065.020; Wed, 21 Apr 2021
 16:27:25 +0000
From:   Francesco Zanella <francesco.zanella@vimar.com>
To:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org,
        Francesco Zanella <francesco.zanella@vimar.com>
Subject: [PATCH 1/2] dt-bindings: watchdog: gpio-wdt: add "start-at-boot"
Date:   Wed, 21 Apr 2021 18:26:20 +0200
Message-Id: <20210421162621.24910-2-francesco.zanella@vimar.com>
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
Received: from localhost.localdomain (151.71.13.13) by ZR0P278CA0052.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 16:27:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d91307a-70a7-443c-c470-08d904e25931
X-MS-TrafficTypeDiagnostic: AM6PR08MB4533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB45333AE0A9287AACF6F73BC9E9479@AM6PR08MB4533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B8QISNmgCSdvQNkUumOCRElzpazj7bvm37uQXp6kDSD6n0NyQN8HrGOEcyC8zo0gEvtuW+itHLTprv+/CR5hJFIWbYA4rCdpVcxJ7NLlZpHtH2sESbnxEW7WBnZF9mSr61aZzQMQiFpdZEICNncnd4sp0sVm2wIK9fs7YxJDG2GRFjpuD6k8hTwXFI02EOQyjrdxflfslHd6WnO5myW6b9wv/T9d4X2RvveeVAfkVZPYWURfZfVNYWgYW84wNfGLLDr+6jzCakQ81ckPU7HzajK+oZXnkoJRIzmDIk2s3QR+b13ixSt0jt4PxOwADoo40cOXVyssWNmkigm6vaX27RT6jSRHziE+N+gHFpmI+dw15iDnmmBLC2FGanu2re9D60gaBl8Cn3cWH+5nrOtKcAhLHWRxE1VjrnbcletDoCbtbcSWAkkr8rj/k+LENUzEsRurcxSnrFwcc66B+Nu3VRXWvvLrhuMSUR61+zbLeove7GXSm36sd4uggvmJ/jUHYzEbpX+FQIWSk1cdQIftZY8w/oM2pKp3NSNLYXoLzEafWxrmADzt+tGb/pApVdDzPHKrO2VC+10tHBLDl5qq9hkb+sMd1324f8bbHvD1ZlckHfMzNZKu1bVvSftMsmdGRMYPk9zlDseoJpL2j6n7IWxC9uEdZZbWRITnd4UKDjYVY3RoBA7xF+OWoluU9m5V
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB2981.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39840400004)(396003)(376002)(366004)(86362001)(38100700002)(66556008)(44832011)(6486002)(8676002)(2906002)(38350700002)(4326008)(6512007)(6666004)(478600001)(83380400001)(107886003)(66946007)(66476007)(6506007)(1076003)(5660300002)(186003)(8936002)(16526019)(956004)(26005)(2616005)(36756003)(316002)(52116002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?05ve205vymPyVxsWSDJyVAEGAmocZHEFU2Ef65CvNoFnpCabgykYuQ8Wa1nX?=
 =?us-ascii?Q?hDlcqjJVZc9HVMNAIUjFrPlXJ7+wmRe2o9nuj2HK4uQ3kcSP3beMYtSnsJNS?=
 =?us-ascii?Q?crsmIDewWv9YtACz/lk7oA8G6Q0pVrchbQ8YZDSz8Wyn6FG9Rp/jkRAjTfjn?=
 =?us-ascii?Q?8RqpxLeVaU+7q5vCo+2OkuqANYto96zLeCnZSrcIWS1KWdJEAZbtD23hieI9?=
 =?us-ascii?Q?d2HoCRY6mzVoiqePL8QahaYhKqZI8s+Un79yPLcMtXKR8EiNLS05nyNxBWSC?=
 =?us-ascii?Q?n/Mat1KHl0dafrfZBGzLTwZfyif5GP29vezyxfjCGSbBpKJLHSQtSBhtOlfb?=
 =?us-ascii?Q?d5pQSqKc0NeT4p5xaqvV68Y2zfBmnnpWnXMFe0oFMwj6z443u0kNZvQh/4PS?=
 =?us-ascii?Q?jbSjqLgaJWtUOn7hiDuTM2GVmoOBqRidRE3JG3NK5mMcd7WYTdC29JDzKrAr?=
 =?us-ascii?Q?mEIa79BVFdHqpCJGTgNs8okJdlL2S/kis5DIunQni+Rg+5g/8aWXYuO6dxcf?=
 =?us-ascii?Q?T/i5JfX7Mjt237YNervuf+8/m+D1reUNoanECsGIJyxiLLtagS5i4prhqhaj?=
 =?us-ascii?Q?gB6n/of43N9FoXyUmwH10JbrfehoKBBfNJKLDF27E6LGZ9Q4n7MWEHvesYpg?=
 =?us-ascii?Q?0spDVT8SsppFffWmcz25Wwi2JMI2iSYbCFl6MGQibbcjkWVk8PN1wlnLaip5?=
 =?us-ascii?Q?XFu9r3OaUhORAqwWDCr5RQxmkKFGlnrxehdDrI1ltM9O1lPF6c59+xSRmUkb?=
 =?us-ascii?Q?ik8eZQGAg3O84sjeKAU7yP7KDrxC1xnu0hqkJvKgkcRYDE2AqaMCl/+Slxdf?=
 =?us-ascii?Q?cNj3JQnfUCDKMplPw9Gy46gQA2zN9SjQOMvdvBsIpCKsQMFHlmfiNWzwOu9q?=
 =?us-ascii?Q?NtEVjQmGHUzyoqDLOERRyvC6J0JALenJ1+T22cF8tc6CTlQqF+xYX/zzzX+C?=
 =?us-ascii?Q?p8pm9hzwCVxVALEN1HAMh7fnx/ACLr+WEMgEjNPAKHbn/l+mZ8JdJAQmInDG?=
 =?us-ascii?Q?Pek0w/Y8/dyTtgKryEYi7Iau4oAqpXTZHYw+UzeQMM2UTOMiOTFMSwOBgT6f?=
 =?us-ascii?Q?+FV7VdQDD0jzn8NPkL9HF0MeZfZt8uNVfcJkSsq8al9t7EHQ6Q6mGUvg96SE?=
 =?us-ascii?Q?Lu+Bya6lKT1usYd7AEDI/o4F/iNzrjXxX/MYru6hJ1a/uL1YeGtIDOV+uML9?=
 =?us-ascii?Q?SidrBtMUmDQq/LKnPIKSERd5ty0ffUaOi31/mrnwR2zWEGTT30EblvrrK7/x?=
 =?us-ascii?Q?WxhKSAPrKBAsrHvcMyN6U0VSlj/4N6VYkU+IZ/k6KWog0ZViO0xa3sEKdvvQ?=
 =?us-ascii?Q?ozS4YQ7od9rko2pHqHFBdRAT?=
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d91307a-70a7-443c-c470-08d904e25931
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB2981.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 16:27:25.6728
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HLkoeC/dgIEYmdnp1bb4KXPtDSXOFcY4DgyKjNTaB+S/wiPGOitpMmcPum3o39NS9zNuPddLVntrQRLdhyTZjz8VEaTVG5Ezt0hfLlXTaKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4533
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Documentation for new device tree property "start-at-boot".

Signed-off-by: Francesco Zanella <francesco.zanella@vimar.com>
---
 Documentation/devicetree/bindings/watchdog/gpio-wdt.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
index 198794963786..cdaf7f0602e8 100644
--- a/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
+++ b/Documentation/devicetree/bindings/watchdog/gpio-wdt.txt
@@ -17,6 +17,13 @@ Optional Properties:
 - always-running: If the watchdog timer cannot be disabled, add this flag to
   have the driver keep toggling the signal without a client. It will only cease
   to toggle the signal when the device is open and the timeout elapsed.
+- start-at-boot: Start pinging hw watchdog at probe, in order to take advantage
+  of kernel configs:
+  - WATCHDOG_HANDLE_BOOT_ENABLED: Avoid possible reboot if hw watchdog was been
+    enabled before the kernel (by uboot for example) and userspace doesn't take
+    control of /dev/watchdog in time;
+  - WATCHDOG_OPEN_TIMEOUT: Reboot if userspace doesn't take control of
+    /dev/watchdog within the timeout.
 
 Example:
 	watchdog: watchdog {
-- 
2.17.1


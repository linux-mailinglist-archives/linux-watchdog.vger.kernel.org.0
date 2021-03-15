Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58DEF33B03A
	for <lists+linux-watchdog@lfdr.de>; Mon, 15 Mar 2021 11:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbhCOKrl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 15 Mar 2021 06:47:41 -0400
Received: from mail-bn8nam12on2078.outbound.protection.outlook.com ([40.107.237.78]:57441
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229998AbhCOKrU (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 15 Mar 2021 06:47:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SC7WhWqqyomuNcYTsUUEBq4hFRKmtM+ciavvAqQH76sxmKGKmLd5H0CsqLbVkv5Saz6oJzeq43BT02pe5tC2zqMR5fmIlfFCqP9mnJxQrT0H7QXJLIdJ70q0tl3s0JNyRD7vyMhfbudqJkQPjS1ZbflPs5lVU++V4dIkpqatehA1AYG/NXg4lxQjRq4EFrIFuuFJ/ErpF1EOs2v1r3xOW9tdiid90ZgOm0eOZNZATIAYxLS3iaG7z3hB3cojBdv8CoYQolX4I8RZVxiPH4jjvJVwh+zbhYzu53AybQVGFrhdPlPEipZ1P8NuMqiAOs5ejrvVsTvCcDLB8T7ACKad/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ld2d9q1D/wzCCpYS3AiacqPYVTxXnPxZcBOInZVynoE=;
 b=b0RbRVExHVg56bhfWsLPiN/zDwdHAj18TnEbdeVIeKf595FRXC58CfWeBvmZPbDP0sleok0KgywszDqP0f5v7Ep/vX3MfLyZGXdnwlwl4i6doafipRlyE6fk+ag8klQKUpawHv/v1KfGnPD6MU/SBInMYkanAJt1+svR+8kju5mWvj6g0YpVJd8FSr/AtdApSXJm80a/0YLD9hyJf0gKnqfbFx5DERGz21cu7tyByVnD8s/XQYZ9TGyW9fMkuWGo0+IKE5H6ylSH7slfPMG3F0aElUONGhRQi4S6lKhk9mtjoEO8xXEXCrTJ3NKVa2ndF5VlICrluUj1kHmSXKnDYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ld2d9q1D/wzCCpYS3AiacqPYVTxXnPxZcBOInZVynoE=;
 b=QuEwf6IXTYRW8ZHF8P6v3/q1sZiwiAuj8BNt0fbeRPbY/9bVPkS81zjrqkfDm1KYbbozIHHCMbi/KGK0tNnmM4B6egEuXWDvfjx1I2hSBX8YTfABYbrkSdym5tBraqnu7lYKSYpf2HkQk8NRqElUwHTnN9GTaxoBaD7fn7NaXpQ=
Received: from DM6PR08CA0024.namprd08.prod.outlook.com (2603:10b6:5:80::37) by
 SN6PR02MB5581.namprd02.prod.outlook.com (2603:10b6:805:ed::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Mon, 15 Mar 2021 10:47:19 +0000
Received: from CY1NAM02FT006.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:80:cafe::17) by DM6PR08CA0024.outlook.office365.com
 (2603:10b6:5:80::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Mon, 15 Mar 2021 10:47:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT006.mail.protection.outlook.com (10.152.74.104) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 10:47:18 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 03:47:12 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 03:47:12 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Received: from [10.140.6.40] (port=50876 helo=xhdsivadur40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lLkkh-00055N-6m; Mon, 15 Mar 2021 03:47:11 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <michal.simek@xilinx.com>,
        <shubhrajyoti.datta@xilinx.com>, <sgoud@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH 0/9] watchdog: of_xilinx_wdt: Update on xilinx watchdog driver
Date:   Mon, 15 Mar 2021 16:16:45 +0530
Message-ID: <1615805214-24857-1-git-send-email-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb832c9a-f591-4f31-f773-08d8e79fb481
X-MS-TrafficTypeDiagnostic: SN6PR02MB5581:
X-Microsoft-Antispam-PRVS: <SN6PR02MB5581B5FF06D7C295E0DFDDD6AF6C9@SN6PR02MB5581.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tdzInq+0QqTcK+2boX28PjGSwgym3pS5TKDVdzYc3/8zLSy7xVp0oMeQ2of5VlVC/1y1Xz2hW3Ryw0QKtRdb5hJhC3fcwf23Yjpp40wLuCganhKC1JS1FPhKyp7QS3ltL2yFxSTd+VoqtAPW1iSVNrPWzR7Ado5CO7pzT7KAHJmcYOCp5Po8yv9QnW1Z/EJSMSxhtGk4KXIyT4DwE2ZFYCuTwY4Ln4GKlF0HE/IY1z1ZiyWe6LE7vdiqKk9IDkeThK5pSrZJ5WtNAPa/H2oLHUI1ncAxX24XkCFsvvxwHBbCZGxka0PMacZ4dJynn4Y3mOi52aZir0RjFeVaGii2YdEqD8m336VkCntlVImToLaiYdLGfio7+KEUZFrdI2U5GKlv6hysXxbGVbnnCZ1iUBA87vPSUEeAtt9BOWzgrlGqxMbzVZo7inukkExnhG9lNeTidx6gJIlgKQRsK+IVqfmmcp93xdo2EKXH41OU3m9YCBVXXrPf1mnDZgHoGqf/HzaWPQfJ/sY/1EdWrNslw08WFKcpy0jJv03XkkXzW/mTQ8mNAI5+UMTjq19WNpJyA2Q99HD26+bhWj4CM1FT/+7qZjwh1AIIEi2Ylw3EsgeTarE4SYROwoVXTrONo95G3NaenXUEeUaIp9/y7JciA/OdtaOhMd1PYs5Qe17S1ypNEgy4oKKlDtw1Qu/9QEuo
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966006)(36840700001)(426003)(6636002)(82310400003)(36860700001)(7636003)(70206006)(15650500001)(2906002)(4326008)(9786002)(83380400001)(70586007)(5660300002)(107886003)(336012)(36756003)(356005)(478600001)(6666004)(36906005)(8936002)(110136005)(8676002)(2616005)(82740400003)(54906003)(186003)(26005)(44832011)(47076005)(316002)(7696005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 10:47:18.6528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb832c9a-f591-4f31-f773-08d8e79fb481
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT006.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5581
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patch series does the following:
- Add comment to spinlock
- Used BIT macro
- Used dev_dbg()
- Initialize watchdog via data structure
- Introduce wdttype enum for identification
- Add binding for Versal watchdog
- Add Versal Window watchdog support
- Remove passing null pointer
- Skip printing pointer value
---
Note:
- Converting DT bindings to yaml pending, Will update on top of this series.
---
Srinivas Goud (3):
  watchdog: of_xilinx_wdt: Add comment to spinlock
  watchdog: of_xilinx_wdt: Used BIT macro
  watchdog: of_xilinx_wdt: Used dev_dbg()

Srinivas Neeli (6):
  watchdog: of_xilinx_wdt: Initialize watchdog via data structure
  watchdog: of_xilinx_wdt: Introduce wdttype enum for identification
  dt-bindings: watchdog: xilinx: Add binding for Versal watchdog
  watchdog: of_xilinx_wdt: Add Versal Window watchdog support
  watchdog: of_xilinx_wdt: Remove passing null pointer
  watchdog: of_xilinx_wdt: Skip printing pointer value

 .../devicetree/bindings/watchdog/of-xilinx-wdt.txt |  33 +-
 drivers/watchdog/of_xilinx_wdt.c                   | 439 ++++++++++++++++++---
 2 files changed, 414 insertions(+), 58 deletions(-)

-- 
2.7.4


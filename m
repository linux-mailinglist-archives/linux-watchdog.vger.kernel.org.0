Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2B734D4BB
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Mar 2021 18:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbhC2QUP (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Mar 2021 12:20:15 -0400
Received: from mail-dm6nam12on2068.outbound.protection.outlook.com ([40.107.243.68]:63405
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230385AbhC2QUA (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Mar 2021 12:20:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cmF1mAF68AzcqrOgMEZH36C/qxzZuzkiU8WGIESVusyYsVhBol+VXaBPbqzF255/VyhWf9dqur1idTExMIxvmZoSgVOCAZxOBG/PhpLTCI9Elz4JLvPeK5LKv/yOV2aWLNhdk9V9ll/HfUOPDI7skX5AEx2Wr2+4hQzw0XEMm5WMO52XIDjgHm+lVzbn0t1RZjQbqeZCyRQtTJJnCw/OiXRtmPDHwB2vtn55qbTFXASzhhjNl5+ZD7tlbgFhRIvYdBMH/cRtoWNgQxRBq7NFlpbCYLemIDhvA3+Zul00qyUtz6CtGDNl2EyW31dAfm3gYEBSKdY9vTkbfFQVVO56mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWvxnAL6VsfRWrdXjApFTGfUiZMoVeAk2UaallH3SBk=;
 b=jrReGQYvdHGtH9hMr9lVCh9dsT2Oij0f9ypFQB6IXUrwwfI/B+TDckZNlt5+vA3pSl4PgSu5Aw9wMe1tePy7gqSbNy530/tBeKNmAm8UnV8fpUavPor+hn7GnUt0MghVgEYlal/2zbem1HrVRcm4snbNLtQE8cLU7GCuBLKfi0aht3NuoPGNAFuwJLmqsHOWKdWq3wWtD2Z8nTeOVwsUkn/Ou+FW29oAfwpyeaCCr+kgLxRifNfheIydE+I8cK7HcZPDAl7c2cG2/sAoWvp9WRnlyJc202aMuSVWr8BCs4T3Y1MFcazEdIsUqyR8s0Sg06o+1IDn7dj7LiD2GgvYxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWvxnAL6VsfRWrdXjApFTGfUiZMoVeAk2UaallH3SBk=;
 b=PohsumA/Az+1/7+75mwuQEwlDUE/Rrndq/fxdligaZ0NEL+g+UCXNRocIH2VgQzKEW/nLQAsjdfNCDCedputKsn/cC27X9y2Ff3ejiBBv8gKiBRqmF2D5AoecyzDDaJcApfYgKDhMgykAeMQX+73ro0fvJHfIGBQK2VD+r7+eB8=
Received: from DM5PR11CA0001.namprd11.prod.outlook.com (2603:10b6:3:115::11)
 by BYAPR02MB5317.namprd02.prod.outlook.com (2603:10b6:a03:68::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.32; Mon, 29 Mar
 2021 16:19:58 +0000
Received: from CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:115:cafe::94) by DM5PR11CA0001.outlook.office365.com
 (2603:10b6:3:115::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.28 via Frontend
 Transport; Mon, 29 Mar 2021 16:19:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT007.mail.protection.outlook.com (10.152.75.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3977.25 via Frontend Transport; Mon, 29 Mar 2021 16:19:58 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 29 Mar 2021 09:19:46 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 29 Mar 2021 09:19:46 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.80.241] (port=50308 helo=xhdsneeli40x.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lQucD-0002qR-2H; Mon, 29 Mar 2021 09:19:45 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <shubhraj@xilinx.com>, <sgoud@xilinx.com>,
        <michal.simek@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH V2 0/5] watchdog: of_xilinx_wdt: Update on xilinx watchdog driver
Date:   Mon, 29 Mar 2021 21:49:34 +0530
Message-ID: <20210329161939.37680-1-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.9.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0fa131c5-556c-41da-89ee-08d8f2ce7f26
X-MS-TrafficTypeDiagnostic: BYAPR02MB5317:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5317FCB2B6BA18F68E6A9C79AF7E9@BYAPR02MB5317.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KWTVUJ7KP/rTxMZ6y0LrkfLbxTU3vjSF20O12CF2qFY7myGuTDkwU6mjjh5yesqDcojk4IhIut1Wir2KRJjb90ZC4Ccx+H6pUGXfZr6Am1tMgTpg0SQ9GbgzwBB9Y5ond+6/bAQHa2dG3u6Ip6ncFotT9tbdWuJvT1dTdu+USxZe6o4sTahMHSKE1unKlvdzoG9chqkYCVQbP22SbdQWeBD1bSTYIyMYKUGvz0Cqz+9CDs4iFksmdCmCSaW6gF5NmxXnsTnj/lRIv5fdU+KKRAQDqtgK5pzcu3k3zR+iG2XlFuAQkTU4xXErhHKy1VZSsq7Z/a1wKQPzBzqSMNI6N49X4MV81U4UZzaVnRJt+9rdH7BgSZ/UWBkwFNPZrjS+N25Xr8wlRDeKbNnaOqjqAKDKhond3rNPv1vEeF/jst8oxE8naUpI4vZvQY+dZHXRiOxgEA00SmbvZFTSbfHnKc5bqUkLLYQPvCm0+dmRPGzhOs7ZnH2T1P6NF9di85oHyMGMNp1Ux6+ivVbeKSVmnWyTh9Em3QU2tJzmSsXXFHN9UgexACaUR/g1qtA1iyRmxgNXrdBn/g3Xu+oDLwxDRsla7udJkZx4fYpW9rVI+DOZBbqJMcHO1a4BM40asU7vs4GBQC313n1YphQyX81Wbw5gJpEdN52dTGL9T5Ahojerg0j20DWIyLmJw1xFriBL
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966006)(36840700001)(82310400003)(110136005)(316002)(8676002)(54906003)(6666004)(426003)(2616005)(36906005)(70586007)(1076003)(478600001)(82740400003)(356005)(36756003)(336012)(44832011)(26005)(186003)(36860700001)(9786002)(8936002)(7696005)(7636003)(6636002)(4326008)(83380400001)(2906002)(47076005)(15650500001)(70206006)(5660300002)(107886003)(4744005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 16:19:58.2712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fa131c5-556c-41da-89ee-08d8f2ce7f26
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT007.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5317
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patch series does the following:
- Add comment to spinlock
- Used BIT macro
- Used dev_dbg()
- Remove passing null pointer
- Skip printing pointer value
---
Changes in V2:
-Updated minor review comments.
-Plan to create a separate driver for Window watchdog mode.
-So dropping window watchdog related patches.
---

Srinivas Goud (3):
  watchdog: of_xilinx_wdt: Add comment to spinlock
  watchdog: of_xilinx_wdt: Used BIT macro
  watchdog: of_xilinx_wdt: Used dev_dbg()

Srinivas Neeli (2):
  watchdog: of_xilinx_wdt: Remove passing null pointer
  watchdog: of_xilinx_wdt: Skip printing pointer value

 drivers/watchdog/of_xilinx_wdt.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

-- 
2.9.1


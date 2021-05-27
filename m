Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0FC7392B37
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 May 2021 11:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235768AbhE0J7B (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 27 May 2021 05:59:01 -0400
Received: from mail-dm6nam11on2060.outbound.protection.outlook.com ([40.107.223.60]:30807
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235878AbhE0J7A (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 27 May 2021 05:59:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GD9KcBbvRt/p1yt3KWXy524kqAWmvohGcKBS+cGztg/vwXUzsAzGewoD1zTwlj0alnn94UNYdu+7Z/aubtlKg0HojWSG/k6Q56pqBAa3MqH+xEntjyjdis0KncZk9QlzliithxaV9NgbZ+v3mEpn1p4CjugXzyclRVrhYbnpZ8JpyVofL2x1fE1NsoPyoHWoAM/BgvI/h7X2Xi4MgR/C5acYZu5/m36XELSmc/WNzO+Y9GGF1wAtTnffcZ16waGY5j3lE5mfFnk3ajjcMwG3DsTbu9LpHiR91HS6WHX/Yaa6fRyqYybrENYW68kLA0BPmcaR22bCfsJRAOoWDZhYyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/MEglQgoLPJBFi7ycmZMO6bo7fE9Zfm/PHQqQzrlZw=;
 b=MjHtmaNn2n4vxL6mgxmUunB0/2DNUd7R8feDNLx6ldkSv0LvA70XQU2PMDYwEhsH4nHXkUdroBs5ysYiYDzgDzs5dgxfBFD2VZEwD83gmGmA3VdgXqxKL7vAZnc6+CRqVmk8GtwsvBEQiDIV4ngZxpW46M2C/JHulIC21yLOBap9bU369FdZv3yZrQHAJpmwHe+14O6/Tcf6RdN9gqbz0Eu4r8wrAz5v/5OrTTly926uFcPlrxtCGRLPW5fZtDPWX+5qlDChsaRkWQk+1QoHdAqdN2O8bcUk/yYdZp5gXnRA2DP3rofr1B3Dz3oMhjr58f/MUTyCyNAo5PUvlPKWBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/MEglQgoLPJBFi7ycmZMO6bo7fE9Zfm/PHQqQzrlZw=;
 b=eO7AwM0Mz9oXe/mXdt7Bdwk83LliiBPeBLhTl19NFoA+pNCcnrb5ULriRqDE5HqCWq3nBoHlJYiFXks9IHSLg8Y0pc/hE2JbgujT/5vWE6/kynw9NXAsSD20R1hEg/48gaJGFLTTdDT5WYO35QuWJl5cNaTRNxwPgcteSuOOxjU=
Received: from BN6PR19CA0098.namprd19.prod.outlook.com (2603:10b6:404:a0::12)
 by BY5PR02MB6324.namprd02.prod.outlook.com (2603:10b6:a03:1f6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Thu, 27 May
 2021 09:57:25 +0000
Received: from BN1NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:a0:cafe::80) by BN6PR19CA0098.outlook.office365.com
 (2603:10b6:404:a0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Thu, 27 May 2021 09:57:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT012.mail.protection.outlook.com (10.13.2.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Thu, 27 May 2021 09:57:25 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 27 May 2021 02:57:23 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 27 May 2021 02:57:23 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.80.241] (port=49918 helo=xhdsneeli40x.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lmClW-0007Zl-7x; Thu, 27 May 2021 02:57:22 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <shubhraj@xilinx.com>, <sgoud@xilinx.com>,
        <michal.simek@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH 0/3] watchdog: Add window watchdog driver
Date:   Thu, 27 May 2021 15:27:06 +0530
Message-ID: <20210527095709.12841-1-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2dc50f46-977f-44ee-d166-08d920f5d473
X-MS-TrafficTypeDiagnostic: BY5PR02MB6324:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6324DF71FA4B5EE71E328A29AF239@BY5PR02MB6324.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fg1Ytxc9+s4KvY6MeT3gCdd6FxQKY58ni78FqQvtcYFlVA4fGDXwzdp2OL3TBp55czqz5NHZCmzoWc3g4AVLCYH3NHtMg4LszGdfXBdnswW3SUDUiWw1mlsnYidFFaiZzcVPyLLAYqK6mwYHKgCY51YjJ37h/KJ4qD9tRg7+sZrGmBOKRCwufgCOy6hnVHbCCjSrgf1J0BpyoWFMur1WSCEyxlNpilM0M8ZkZcpTXTpXLSg02m3oNyT8bkcUYQLzcX4a40+n/k3gZmpbecSLmOQ6DPPPkLxCYfL0azfEDE1mmsNh20pkfOTRhOeJ3YD0TfGL3sUzdKJQFAH4edx4PZoEraBLoZSzsqaQlwawffLTBc4uYzoF5GiiGO2zlbCnVPXi3LUTztINtxrNlADsiEhiJGuhk4SYiq+dVY2eMg7XTdU/IK1VMKiofHKAcRJciftg9rAvB+ybz0v9XVo5L1JbLZOS79MWxezEa9t+7VjTgZQMeRWKEI443m2vjADOloJqdaAyZnj4/p9q87qIcbii8i7cWEtaSNsBtI2Mfhk/s7uw/AThjIMnHsfsdd1wlObHYkMP0IkRFODtKlDH8fOqX69sDakX1TzQLs8C/TPWmn/rX4SIvpQO9x6Sf8F3X1KFW+yNyFxaNy8A7Kxre6ORoO2zAYSxSSaSNGnDh8gPQV14C17giPolDx3K5DNd
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39860400002)(136003)(346002)(46966006)(36840700001)(8676002)(6666004)(36756003)(6636002)(356005)(110136005)(2616005)(82740400003)(70206006)(426003)(316002)(44832011)(7696005)(36906005)(186003)(70586007)(5660300002)(4326008)(4744005)(47076005)(478600001)(26005)(336012)(36860700001)(1076003)(7636003)(54906003)(2906002)(9786002)(82310400003)(8936002)(107886003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 09:57:25.1602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dc50f46-977f-44ee-d166-08d920f5d473
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT012.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6324
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

This patch series:
- Add xilinx window watchdog binding document.
- Add versal window watchdog feature.
- Add MAINTAINERS fragment for xilinx watchdog drivers.

Srinivas Neeli (3):
  watchdog: bindings: xlnx,versal-wwdt: Add binding documentation for
    xilinx window watchdog device
  watchdog: xilinx_wwdt: Add Versal Window watchdog mode
  MAINTAINERS: Add fragment for xilinx watchdog drivers

 .../bindings/watchdog/xlnx,versal-wwdt.yaml   |  71 ++++
 MAINTAINERS                                   |  10 +
 drivers/watchdog/Kconfig                      |  16 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/xilinx_wwdt.c                | 382 ++++++++++++++++++
 5 files changed, 480 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml
 create mode 100644 drivers/watchdog/xilinx_wwdt.c

-- 
2.22.0


Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99B39392B3C
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 May 2021 11:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236004AbhE0J7S (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 27 May 2021 05:59:18 -0400
Received: from mail-dm6nam08on2042.outbound.protection.outlook.com ([40.107.102.42]:14048
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236001AbhE0J7P (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 27 May 2021 05:59:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YCYC6hiT4q2stpvnW/CaAr5xgibL9ggYFmQBKvfIBbCoKYdpKImYRtU9Uy/inp4TYEd7Je2U/90jjWb+4DSoVwwNAtE6/l82MlSU+A3mFR2pFXCPoxUU1hbfg8c5zRqQyAAgNApnPyipwiczU3rfddqL9mTODzTNVrZR9PZ2zQtDceQiVZfH++bL1AQO1x4bA+qXZkYiiAnSR4KHRQshIaHQE9Y/oaiUhCjbmcBXK1V1KTJkp24/VSHalr282aZurxC4MSZe9ThLyRE6Xwd5UH0LL9c0sNx7qlDVJtSoYt6GpEzBvxUwKGYSC3ZTpLWg8jAVJk2gaVMXGsOG4LtY6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/YdGTTIb9uY67GRwt3EkKBPejSrkLogFkAXa0Q3g9U=;
 b=fashX6HQwKBD5VoNZ5Wn5NCNcoSuZlk60xOk58nISe2JR4i1ZBKyJyDfRwaTCunQclmk5oxAs/vJk2Eb+lgLDNt+RylcTgCfM2pHJYahFwTT4f3+oaXwYP0/j4Ue5S3Wgjpd5tquM6Jj49YhiqPr5Ms5PDFwYBVKe65gj+TkPSop0XEmA4ssklk1EAJCH2orN3Bi58+TJZT1C4f9xy5T6Timu020T197rRae1ajPDBXO5PA6i7FEnlEMZ1brp2co+0zgzYn1xKwCRXa51f5eTCW17r8yoLtB+XKIVUIBIK2CSD/3TC9zOkVyyfot9CB94VNWFiS4U6K/5YDTYp1Ynw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=roeck-us.net smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/YdGTTIb9uY67GRwt3EkKBPejSrkLogFkAXa0Q3g9U=;
 b=gfE9iltZqivOoJ1OEyYAGISjEBlXhcrGdilGkN5wnYBu10wIPbxwOvRL9LdI0swWJFuorlnJJOOJ5FekYun7gKkfbdPnlxfs+xqYFuvVnTXe6aARh9wbKSZy51DYaOYEGPCtjtBnTknwYzaOBGzMV6Gmb634xELZsfwdJ+D7eZ8=
Received: from BN6PR21CA0009.namprd21.prod.outlook.com (2603:10b6:404:8e::19)
 by CH2PR02MB6613.namprd02.prod.outlook.com (2603:10b6:610:79::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Thu, 27 May
 2021 09:57:41 +0000
Received: from BN1NAM02FT029.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:8e:cafe::f9) by BN6PR21CA0009.outlook.office365.com
 (2603:10b6:404:8e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.3 via Frontend
 Transport; Thu, 27 May 2021 09:57:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT029.mail.protection.outlook.com (10.13.2.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.27 via Frontend Transport; Thu, 27 May 2021 09:57:40 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 27 May 2021 02:57:26 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Thu, 27 May 2021 02:57:26 -0700
Envelope-to: git@xilinx.com,
 linux@roeck-us.net,
 wim@linux-watchdog.org,
 linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Received: from [172.23.80.241] (port=49918 helo=xhdsneeli40x.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <srinivas.neeli@xilinx.com>)
        id 1lmClZ-0007Zl-B4; Thu, 27 May 2021 02:57:25 -0700
From:   Srinivas Neeli <srinivas.neeli@xilinx.com>
To:     <linux@roeck-us.net>, <shubhraj@xilinx.com>, <sgoud@xilinx.com>,
        <michal.simek@xilinx.com>
CC:     <wim@linux-watchdog.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <git@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>
Subject: [PATCH 1/3] watchdog: bindings: xlnx,versal-wwdt: Add binding documentation for xilinx window watchdog device
Date:   Thu, 27 May 2021 15:27:07 +0530
Message-ID: <20210527095709.12841-2-srinivas.neeli@xilinx.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20210527095709.12841-1-srinivas.neeli@xilinx.com>
References: <20210527095709.12841-1-srinivas.neeli@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c80c0ac-8806-4535-7c10-08d920f5ddae
X-MS-TrafficTypeDiagnostic: CH2PR02MB6613:
X-Microsoft-Antispam-PRVS: <CH2PR02MB6613FB7D931F723FBDCD9BB6AF239@CH2PR02MB6613.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CT4zjHC/y2dV/s76gkIf+yvNSkjq++7908x/Wz2vXe3MPxjdXDkv/eRUmSeOynsjSmgqGnoUZFAAPpvlAWc4c3A/Lfog1dFPoPKMeG2hUjX/mvjULBkOLmCkgEVvg4glquZWjBpdPbdFI3BVdm6TeTFR3bSPtDYtpEcKOSN7sfH/9NB65e5luDKSGBuumQSR9N2F7ibA1nzjIlf0+RlXM+u/gvx+zYhjc0lbM30gh++RCryxG/oYO9FnJ7a4U6uaYonzkx6SongK950UiKTq1MRQdPW6Rmx43nmVoQNJYvINT0lbgHUnInC0zKzqdo5YArG7ZKXOE1yV59mSOLdS+fgG/n/Or7/Xergcn1JUBiaIy+eWKrwyPUsYQi0zrb0smhbj48OT3E4PLBP3TDgySY0EKjHW2a6/NpM6QXa89pDnUbpsu0flBEryeSukJW7vGZAm0y8A4e899JBKOTRjsoA/5AQV1Px1YiK4KVr3KmXD7wHcPWMsDgYL3WOtxPN232FnnzEGovjnioQgWvs5Fr+4FETfI9xr25cDli5Ggn7PeB/Md3G5S1frrER4aJz5jrQpT+E3aKM7UYiuRVC0nOmMH1gLsI7dLYk7EKcF1d2JHPp0GeAp0yJBjWPalZ1KpolWlz0XYM93DGPziOzjti7GOslsBvLDFS88Jq3YzOD9oc0QlGuq5mAx3cviGkXjdXuiIJxcdXK0XGy0T+1kXSrhNkFb5iGbvTGwFnihVJoBW1IYt8S/nZgovkBdueUHEk5cu0iejqIIol/OVUbYIRrMk4Lok4mCkJsiN7Am7PeARPT/oOOnTYR3uaFtZVx4Pe7wJYUz8O1Bbradl+WLbA==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966006)(36840700001)(9786002)(478600001)(26005)(2906002)(966005)(36756003)(107886003)(5660300002)(356005)(4326008)(6666004)(47076005)(82310400003)(82740400003)(7636003)(7696005)(44832011)(36860700001)(8936002)(83380400001)(186003)(70206006)(36906005)(316002)(6636002)(2616005)(8676002)(70586007)(426003)(336012)(1076003)(110136005)(54906003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 09:57:40.6442
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c80c0ac-8806-4535-7c10-08d920f5ddae
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT029.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6613
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Add documentation for the binding of Window watchdog device.

Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
---
 .../bindings/watchdog/xlnx,versal-wwdt.yaml   | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml

diff --git a/Documentation/devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml b/Documentation/devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml
new file mode 100644
index 000000000000..ca03ee9db9fa
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/xlnx,versal-wwdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Versal Window Watchdog Timer Controller
+
+maintainers:
+  - Neeli Srinivas <sneeli@xilinx.com>
+
+description:
+  Versal watchdog driver uses Window watchdog mode. Window watchdog
+  timer(WWDT) contains closed(first) and open(second) window with
+  32 bit width. WWDT will generate an interrupt after the first window
+  timeout and reset signal after the second window timeout. Timeout
+  and pretimeout configuration, Stop and Refresh trigger only in open
+  window.
+
+properties:
+  compatible:
+    enum:
+      - xlnx,versal-wwdt-1.0
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  timeout-sec: true
+
+  pretimeout-sec: true
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Watchdog reset pending interrupt
+    description:
+      Interrupt line names "wdt" or "wwdt_reset_pending".
+      wdt - will assert high after first (closed) window
+      timer expires. wwdt_reset_pending - will assert high
+      after second (open) window timer expires if WRP
+      (Watchdog Reset pending) is configured with third
+      (SST) timer.
+
+  interrupt-names:
+    items:
+      - const: wdt
+      - const: wwdt_reset_pending
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+        watchdog@fd4d0000 {
+           compatible = "xlnx,versal-wwdt-1.0";
+           reg = <0xfd4d0000 0x10000>;
+           clocks = <&clock25>;
+           timeout-sec = <30>;
+           pretimeout-sec = <25>;
+           interrupts = <0 0x64 1>, <0 0x6D 1>;
+           interrupt-names = "wdt", "wwdt_reset_pending";
+        };
+...
-- 
2.22.0


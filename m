Return-Path: <linux-watchdog+bounces-2051-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 358A3987EB5
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Sep 2024 08:51:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B30B32854DA
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Sep 2024 06:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4741317ADFC;
	Fri, 27 Sep 2024 06:50:55 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2116.outbound.protection.partner.outlook.cn [139.219.146.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BA815D5C1;
	Fri, 27 Sep 2024 06:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727419855; cv=fail; b=VZRN87pOTYUPvcsQtg4MdwwTjj2P04ot7WdOnkehtINoCEUWpSXeMcI0ogIRSBq+jpU09LMrvpGoLpsxTqqRwpXr8DrrV02ti+9FMTT2Qg6GGmMpkswwCXtPRwaiMANRqMV2temJ+hj+iO5RboDxozoduq2meZtHlxwEcAoDZ6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727419855; c=relaxed/simple;
	bh=JZjloVqb6RoT3pnlZByOIyzo68aLVJA6mI0uyPnbYis=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=oNBBzrqCUjarWeWUE93bI6Og8owIaniDaCyzOjupmDd2n55ZJTXxtnZs1yR5qnqpEfRx+EI25g6uYdsnCPT/eyiDfsbFAoulAtaC9RyT7WcQ6vHIU6hNw7/SPOIb6/rw98ix44ZQhGczRSEGr0zxT1vPzEU9kmd+caDtBkUAVEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1sYStp58NDDMyt/9H21sT8nOXlfa+M4cd3WV7scTbcaPJZYMdFCHcf4K+HxjcoZrCoeXtOm69scONY4k/Xx6oUHCkoqfAIzHuYqNedpQqjlfnn0ZlfIlOEFRKUV9g7Hcvo+b9aiTGOGdmDROppaKsL4ygu2T/ZggHFR1qUuK4w5VwrP3/Z3b1l4dD5e+bIFaKqjL2z7rhVN97Ocei6YKNPV65IFhrcmfxRsrUa0wV/NphtPErW6TVXVnvMYO6zUAsfwZOmWaqoJ/nYbNTbC7q95AK/RoafNm6tLR20CHyObZ6ZVJvplZ+qlS1TjAoBQCYeUpXZKkzLCLYCD1vTtPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8fshkL8QwkCD4nF3sKqLPVv1ejn1/tKdqPGo2yYkOQ=;
 b=F9sE2L85MRH7kfoxMUX6i4bk+vV8AiwFBAmW8rG+OPnP5PQ68vdRkn4GT8wRgOADKPFNR2P42IuZazA/p1jBIYeUX2LCqr2EuHR5utewlNyBeCG493q4Io43SE+xBU20/XSadzJG3v4xewSZbUyvdf8EeEntXMsPoEibAOKprgXvppYLO6ROLs9rB7HVn2nWtRmpZ4vSen+Rtu+yjsqJdGa3kliIwEWq9tcL7dhYDmJMUQwbkKUSgxQS6jhhKUmGv9cw0ZP5b4qVE2X4aYsy6dTV6TUUO8ol17Ahm4wWDpCoKL8LWYMFs6k9aKDB9o5b6sCfGflS07KLktDDegrvFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10) by NTZPR01MB1033.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Fri, 27 Sep
 2024 06:50:41 +0000
Received: from NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 ([fe80::40dc:d70a:7a0b:3f92]) by
 NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn ([fe80::40dc:d70a:7a0b:3f92%4])
 with mapi id 15.20.7962.021; Fri, 27 Sep 2024 06:50:41 +0000
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Ziv Xu <ziv.xu@starfivetech.com>,
	linux-kernel@vger.kernel.org
Cc: Xingyu Wu <xingyu.wu@starfivetech.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v1] MAINTAINERS: Update the maintainer of StarFive watchdog driver
Date: Fri, 27 Sep 2024 14:50:32 +0800
Message-Id: <20240927065032.2773997-1-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::21) To NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:8::10)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB0956:EE_|NTZPR01MB1033:EE_
X-MS-Office365-Filtering-Correlation-Id: 80bc429a-54d5-4731-e2b0-08dcdec0b39e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|41320700013|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	OHjSDcUECDVreN1J13fvTiQ6vtpzg9icE70176wlzTKXfjKxbZVSbEe5F5NXUPxWvLhvdPI86+FdefA/q/JKsIhKdzOvfInLryrREdK0wnQGdMg8DJOhrj09p5Z49kAAjRNQn9QewU3WG/kMHqDUfBrMomkgxo51IpV1OmUBQZ8a8uiHSJ5xaYmQSifdIIRMM//iY5gPKgGc7AbO1OpbyLkUXj+/FRPXbEEzckVAb3mkuxvL6cU9PLlTa13FuT4Jp+bysvPMkojxHSpV5eqa2kPiwvpZs7LZMPUa6W99sUdxsqLUEJda0wqVaVX0bYoNn5vbFpKyeRCRxbPWfem6xYI4LDNCGHqF/8q1omgUE9tBPJsYw5v/y+ve4ximNtdy8q7ut+HXmF79DtrGqpyjZ1L54x5+GzNLybdahbdM8hndYXKrHu3tzj8PBL3P7JIqqMamTNF3knXhwxcv0eO9V2yTnXP3WHeZlTuQmqRAxjkiArN0ql/5j+1gAmMDk7QCzP9jyWFBQeyh1HCjMSldEEeydDym9uv+qi3wXNgVzosHXzRD430uyHivu9/2UaDsVdRqA36SlhIjZ/RXn7wtRR/sHM0PL0hSBHf4TgTFqo2OhvO0hIBy1eoe6xoPj3iv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(41320700013)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?repkQhlf5o0k6LPkjyMwwi1FJCoQx+ySdBTYVzpUyrwNyhXO+AeWsO03K7/s?=
 =?us-ascii?Q?+MPBzo4ySHjLxkTyprCxAR7JCrwOCgZUpul9ieHKoXKntrNLpeKFX66msArc?=
 =?us-ascii?Q?Pe9A96nqzMvSr2vog0oKnOkUFfbeOPG2GNzZlLug5K4UAIZsC4MZAN9tEfGp?=
 =?us-ascii?Q?zkLOoy+/14nznqIXXEPbss/BVirhtb0kPVcYP2vYNIkm0jcSrbeaTikq3W0n?=
 =?us-ascii?Q?EhOYcEKzkcAi9AXal/9ot0JzHnhJZV/URzA//08Tghz6C2CyX2JifLFBHhk2?=
 =?us-ascii?Q?DNZGPsIvZNfm1Sp8W2XEuqk2bCEFpM7O2bKtAlo3kGc8D/CmYFJOsxpGfWoW?=
 =?us-ascii?Q?cNAjlwdJIHWLqE1HvVuaWZzbcJ5i5mPpEXCckQC1WZFBoWAiAl+5d1L1Ivk8?=
 =?us-ascii?Q?oE6f7yQVH/XmbRIwdavuAHIpdQFHYcYzGQ6h0zjddlrokuqBUdtsYdHK/CBE?=
 =?us-ascii?Q?gjJv3Rsl5NQMv20rJOXRNuAqzB6y9fbnOaf/Ii0Q7FlvbJc5Xv95BiCvKgYU?=
 =?us-ascii?Q?+ImxJ3slxwZl3j3CvbJ00qdTwbtf3ayl87PPPzAd+pkW06mT6AwrXqN/2sQf?=
 =?us-ascii?Q?QYGUMzw3rjNN1N1y+6GwPo+9uE1NF4kZASjogHmFiLzzx4EUf8jgffCwyr+4?=
 =?us-ascii?Q?1Wwnqp9AJ1PewXu6cuExysOm0O2TYs18XZdFNxxeWFSWSR+CirI3EtjUkQnl?=
 =?us-ascii?Q?ZELPlr7xceYMclZxrtXPRyCbeVodlwSDOKOQYCOoeoQo+GFrWAyQEVUFPF1i?=
 =?us-ascii?Q?I8NMYtVm791Jx9w3JOjOo4Sv5ws21FVXnUD6C9icPDo/Xlas3kBQGkhLW3fb?=
 =?us-ascii?Q?OSPUZQltiyU/Dm+XS8yc8rPCztOGekrGcd6dlKi6u3/dRT7EYns8mQ9NwCvG?=
 =?us-ascii?Q?KuoNmMwZGpDt5I03uTV0FxnD9Sqsy4zcMp/3HdEtaBChGMbjhZUIGnhU/TkA?=
 =?us-ascii?Q?p6ouIc3oXy2RiF3YItB9N+HuYB30QtSSY2nimxp7HsfPc3vla9nyGJay9Irs?=
 =?us-ascii?Q?RBmyd93Gued5rgLnSc1Vcpcu5zN3+A04s2j6zgnpGhWwQK4CCzjsD/iJXh4x?=
 =?us-ascii?Q?t/mcQAughtCHbYkfGzi6rZ/0oE8I6OVgnBYQLHGiChY8raxafxuMEvBg/VQJ?=
 =?us-ascii?Q?2SOPv5VV7WuLv7T2igKgky6BDAjx6w3+Sx1ViGqo3mO3wP+SLpZ7w/a7wHWn?=
 =?us-ascii?Q?ET/JAUVxYaOAbbgyqNbrirYXh58PJggP6u7GMwQauYmAyb8ggE0e+t5Q3sfg?=
 =?us-ascii?Q?6IdfTI+poHDgmDACqRIvtyeINDlWdMnT3RyzGR47fySvDU5FWLGWgkGba0Pt?=
 =?us-ascii?Q?uCLpRBjCrcXkUt4VAdlfbB7iWZwYz9+CZWRmoiLpum8Ye8ckvlX5NHCtomH+?=
 =?us-ascii?Q?u0SKbSJE3joYtO4nyHItttSo3umdI03LIpCtyQ1AQ/nZpfLdZjUMiWS2jriY?=
 =?us-ascii?Q?LX6dyHotEbR65qWw2ndLocvNyhlKjZsM9vVKBXAqsLMGLVVMejDDHanBVzSh?=
 =?us-ascii?Q?8TazMpxCTJMoyP11pN7/X7on6sdo/TAR66iMLkjG706l/UKfy0nolI+WfvA7?=
 =?us-ascii?Q?Vz3Zr0dxD24VQSi//XJM6PXQxRviPvZcPkrP9UH/z7/lgw5rtn6g/jb436NY?=
 =?us-ascii?Q?FQ=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80bc429a-54d5-4731-e2b0-08dcdec0b39e
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 06:50:41.0699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qd0bireWFAmvL3s9/hESmO1XBubsWbYMhaemtfBxymC13Js28ubL1fNWxZpxKVUHY/an6dLfjaNSmqAYNnjKzGxrQ0nv4LlxMeV/LbX8FQo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB1033

Samin quits maintaining the StarFive watchdog driver and Ziv joins instead.
Update the maintainer of this driver from Samin to Ziv.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc40a9d9b8cd..3c4276b2e72e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21846,7 +21846,7 @@ F:	drivers/char/hw_random/jh7110-trng.c
 
 STARFIVE WATCHDOG DRIVER
 M:	Xingyu Wu <xingyu.wu@starfivetech.com>
-M:	Samin Guo <samin.guo@starfivetech.com>
+M:	Ziv Xu <ziv.xu@starfivetech.com>
 S:	Supported
 F:	Documentation/devicetree/bindings/watchdog/starfive*
 F:	drivers/watchdog/starfive-wdt.c
-- 
2.34.1



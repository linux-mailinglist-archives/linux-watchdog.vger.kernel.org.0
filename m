Return-Path: <linux-watchdog+bounces-4897-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFlXIz2UgmnYWQMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4897-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 04 Feb 2026 01:35:09 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 16595E00CA
	for <lists+linux-watchdog@lfdr.de>; Wed, 04 Feb 2026 01:35:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1169230AF773
	for <lists+linux-watchdog@lfdr.de>; Wed,  4 Feb 2026 00:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC2A163;
	Wed,  4 Feb 2026 00:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N0MMIHuC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011005.outbound.protection.outlook.com [52.101.70.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFA41E1C11;
	Wed,  4 Feb 2026 00:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770165307; cv=fail; b=tke+wD5ctat+RlV26f7RDNsnuBYFD/ZN6S1gKN2OvxeR7tMMme0e2hl39FirlzUNCwjsftoTl8LPd3yvaPGRdExLIvKTb+Udljv6br5mdZS+0CcOqNtQDsY4SOMX01rteUx5I0BcXte822Z+dCsrepBIfsUx7fTRas3yrNIWRh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770165307; c=relaxed/simple;
	bh=j2QKbZOpl4HWYkpSC7XlXxUSKDEqpGJeryKaJwVMewU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MeNSUcA+v9g2ckhz11BbvzRFwj8Bf5rENHMQxk8AONWHxBvg8F5jaY6BZyKtzHdaBQU9GQJSIlMyPqz9eeTx8+Ac4x7iEmTzQaqiXxS7T2BWnb/cOUv8r0nYh/e+cfnf5ZmrfG59/s1LRoHzKygm65On3za91PhuOwCW2+d6NY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N0MMIHuC; arc=fail smtp.client-ip=52.101.70.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahgrPKv6KyLqVCRHTvf66AOp/W8IyMmo1kxqDVbjiFgjmyX/rPBKD2gL1AWk8CgfvmJNWBFm04nQezlCFMKe65enUT1N7dbONrFvUygbFO0cMg+aLb1aJ8dNLLs4S/avzH6/CJkagAegISB13Zb+1LxStru4otrBDQwgUlj6Uef1/kTnze6aqDMztMqEm41BZTak81oiUOetACQNWlaJ0HgRWCfbjD5/xo0d2UJWR8dWyje+8A9prfuOkHobkllPup5xIKsVM26Amkp+a4cCg7DPihWkuMyf6YVP7Y+hPIXeqUA7jPDqY+gGvyiygAhv2CVBAMJk773zKYjxEjQj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BB6Zg8zvsrzX38TTz+JjiA3VMCPEK8sYYdAXUFK7a10=;
 b=cJjdSzwn94eFvelJl/hk9t+pSoU5UFSnDQiFL5fl3MKbA3wVTjk6RjD4IFZrvhWlY8gtpKnlkfEIQ+p2p1a7XAvtnV6N1zkF6mO8sw8QnMKK3my4M7g6hknA8bhGbp4ubnLJCEpZKne+Nky7mpZG9/hGMwXYcQSt+EVB8t7QhEMhUgitJVwqdn0xz86TYO6FIuckDw5upKJkZUUsACqgBrOnvYgHKuXSFGaFHn54SvhpnQeipX6CSV1arjtvwP8bCwDIDyAYe7l6ZhAUhc+8XXyk9FYBqH/BDzkk5XcwPsb4nNs5+UDTXimuPgiO1xKeUbmiwRsr/WXcFpKB21BCVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BB6Zg8zvsrzX38TTz+JjiA3VMCPEK8sYYdAXUFK7a10=;
 b=N0MMIHuCvJPO9Ct9TluoC6+61wKWSiOMxS1JLZKWGcOIN4airBlbyPTB01Y9zLlTUP3HuBeexSjBzcC1E3kH/5asf5tNtEkw38OgRr09aJswVPEEks3EitJkCr8eOnoVNs3E/KmohCRZu/1wgBIUE+wlMAcYnjU3rosW/gcA3/PV/P8nsVnmFBFEGFqs7ApLwzK22b/RxEWClmurgEb/1HDryRSfakfTe2EqLPGLS0Xa60KHlsiJJPFXkHprfAagpoleCVDSRyn+GCUDa8WDorz1pHo1Xc/rt6w6dctSBrXqb4iGsfpDNCLN+JemWPe430GzgwBXlw11E6T5qsynEA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB8976.eurprd04.prod.outlook.com (2603:10a6:102:20f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Wed, 4 Feb
 2026 00:35:01 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%5]) with mapi id 15.20.9564.006; Wed, 4 Feb 2026
 00:35:01 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Frank Li <frank.li@nxp.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Ranjani Vaidyanathan
	<ranjani.vaidyanathan@nxp.com>
Subject: RE: [PATCH] watchdog: imx7ulp_wdt: Keep WDOG running until A55 enters
 WFI on i.MX94
Thread-Topic: [PATCH] watchdog: imx7ulp_wdt: Keep WDOG running until A55
 enters WFI on i.MX94
Thread-Index: AQHclOO6ma5frXFoyEWg+u1pGIzsl7VxQ8aAgABuXQA=
Date: Wed, 4 Feb 2026 00:35:01 +0000
Message-ID:
 <PAXPR04MB8459E30457A6451C622290768898A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260203-imx94-wdog-v1-1-7deb76dbe350@nxp.com>
 <aYI3ZYYSfI1Gt1RT@lizhi-Precision-Tower-5810>
In-Reply-To: <aYI3ZYYSfI1Gt1RT@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PAXPR04MB8976:EE_
x-ms-office365-filtering-correlation-id: 5eb5afeb-a42e-469c-5957-08de63853b9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|19092799006|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?E/ZeKakMh4L1QRXF38aybd4WjsMFKPbi7FWqohxKc8xcL92HyRpNYgXe4P2v?=
 =?us-ascii?Q?r9iIrt9NA7ATeTU/Du2DWCx/BeqnePOPo5NycvFpYPmqqz6A72UDM6bht3bR?=
 =?us-ascii?Q?UA7qwXF2viJXeF6+kgnCR8+TvqnaU1+gSucSZXxK8wb6KgHf2HsCrrm2JtR4?=
 =?us-ascii?Q?d+J6B/aQbOw4wISUlA54UuoRw3YjKCFJrXkzUI4xgkdkivHreqfJVdlBS72h?=
 =?us-ascii?Q?PrrNTbHIOxYEw0Zo/8aNl7iq0e39un7G2l2QNseyJI0JeeqKDSu2lIJaYQYI?=
 =?us-ascii?Q?F1TnlbMORbNPArt3bYq34CIx/C2UTBANu4FuXfFCwNXhQ4S7mJ6DDR/Xb+cg?=
 =?us-ascii?Q?cH8+1Y0TnSrWTot6JLG7faWm2qcMktM1sBTwfaSpu/VT89k74yiMi5Zo4OiF?=
 =?us-ascii?Q?jYbtfonqWfnzr1vxQcqJDk/EZkJPJ1wqAzMU/fjvyCzHh8dNJ5JLCX17JLpJ?=
 =?us-ascii?Q?4/t4L4nMQXtqtsSSL+FwvTWgcQIlsXT21RFJIySKByWZ7w6+qapN0I3R/kA+?=
 =?us-ascii?Q?LUHTL8rSQuqvsMHKKTu79NjPzjo/seZxwrQHaWpzUbl3VrkAb/GFOUSX0+FN?=
 =?us-ascii?Q?1CBP8PViYVuOrKC/owLG6ooBRX7XcaRgeAID27T9ODYsW+wbY22XIFfhgAS1?=
 =?us-ascii?Q?ZIOYLn/dpQP2s6VkoQLnPBFDeVC5LKEALqhTeV80lwnYlMACc4EJerF7V+GY?=
 =?us-ascii?Q?g8AX88lrenkzfAKM/wZkWN+bXCW4xGugdcfdSKVyCx1r/HM4+xZDCGPvreo3?=
 =?us-ascii?Q?PXQqUAmsb0CI3NVidcEfh9enFdcf8WMAPt6BOckEyY7f4DuEvf8oT5Vy+iM2?=
 =?us-ascii?Q?SnXy666FbH3xHHIpEej+YkEUZ33bIUevteggDa8uuP/TS/9ZROojH2wKXGAv?=
 =?us-ascii?Q?z5TJsR36GX99tgPRz+0Ls3dlUIE3ukRXkOwZJvAVivnSsc1eL5TOvd5PimIZ?=
 =?us-ascii?Q?bhfDZlv3d6X/23YPz0Hxhz2Ql4QybXmt+LZkd8aEOMD9gpzaBQCpZlCCZht0?=
 =?us-ascii?Q?tGyDfK68utL5qvn3bhmNFMy8SJxdqKzGSzI9xybr1Nn0/NFpvIuieGrYiCsA?=
 =?us-ascii?Q?zjhh+EW7CWgSLrQb8HPnP3dpsyNUBda3tSEEOEsDQrk0x0nKMnrdov9HcKv5?=
 =?us-ascii?Q?u4rk60LRagm03nkgvVV7cSqEH0xVjWjVcvJEhCAKssUytO9MnbnJiTLVR1eL?=
 =?us-ascii?Q?VhVXEjGnXqzexlvPZ1kFmfPQYhr5rCOx8ehUxi8S9kQcOBX0xjRofYNHmR3k?=
 =?us-ascii?Q?axpAtsMbQJ8Wz0DKuj2wrygZBTpEmaHntuePJHZxxkrLvCBT3Syq5ItDzjWM?=
 =?us-ascii?Q?91xpz9//8stCYZbGR4zLckJgRzTKlZEgpEtizXSiyrEy5eGFRNmeW1DVS6+q?=
 =?us-ascii?Q?g/F0xuqWIi2MJ7FUECpyH+DFcq6H0uVEc1nvzjAzSBwKfNrWuz1f2o6wrbZn?=
 =?us-ascii?Q?HZ9n9Xuq5OwIPgWyurrHmw3WIwRRUx1HwsKGqLKqFiBi5rHRW1aBR2b6cvZ/?=
 =?us-ascii?Q?/EcZVapX5/7wg5Srqbhu34BL7GlVYJi+e1oYqAnAdxgKNdYuFVWfHYcQERSp?=
 =?us-ascii?Q?eCNi3ZkFa7no8aIrXsqcuYWNp5bWl8iiOXy6L9Cvj9PY/PsSKv9MfbSR65yN?=
 =?us-ascii?Q?SBfJKpNjvRfoDzK6xJLz0zg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?QhRIfXcMz7+EcNtDatnRy2fJwK4cF7335qCkR4TkTEGv2T8QIBoUgUKxTQdO?=
 =?us-ascii?Q?t8Jw0TR7pEB+iFZA8ccypsxfshVPo8g1d5Etn6H7Q8B6xIn2CE3M53CBKdOE?=
 =?us-ascii?Q?2lqck8yQ7IfwqsEKeR6OKCEOQIhw+/CbN3pp0J4CJBDTkx1Tk+lqH0uILZvX?=
 =?us-ascii?Q?bMubiOBwoR2+IZursHCmqF+uAQG/kQKZacQKRba3mFQXuF7/YISP/eepQiRu?=
 =?us-ascii?Q?By44hQ0pX4tD8iqsyhpudvYMfq13paLfK5Z2wAct1+SZFFN6zp/9bgKWZMYI?=
 =?us-ascii?Q?NlRfJkS/WyYp4idSRcCpwGgTezX0hlW2L0fJy6nGI6KNKAu6ipFXJNwIkIKp?=
 =?us-ascii?Q?pPVAXbQhZht9v5unvoij0N9XaQI83bPebgVfgFjPGjzF5iV/40B0qXfemrBB?=
 =?us-ascii?Q?4ENGmExuUq4ZAcGtJbK8j92OumEi+Z+8i7IkoCgNsdUrg9oUDSIauUFbU5Y/?=
 =?us-ascii?Q?vNX3p7z0EMhG9QK2TR6/d33Kn2CMk2a8UDANX6QyHdN1ZkYxC+zgfU1HohZD?=
 =?us-ascii?Q?2aKVuv9be5sOULHqeFPnFK+QAf1D9Cj1aWTiQrxXsGv5Pg5w427uoVLRmTHs?=
 =?us-ascii?Q?B8D/1kFt/eE4DwDOazh3l5LEqnyg7GUx6mnlI82o7E0MuZk6v/qTFXhGVWBz?=
 =?us-ascii?Q?EIoOlu9ECCqOT+zVNez9ghffTHYtxlzzKCyJzZWEyAdGENzHI+tACJfv/FrT?=
 =?us-ascii?Q?gmNchLDMRdX4CHxjWEV8UkZO3zFBAa4/pPmwGDu09hj5tLaco5RAFaBEqffS?=
 =?us-ascii?Q?obz+frjLWQa7YE1wP+of3BjdfXAX4oqPL2mmyCvDdBG66L+/8fHQXMuqCp2r?=
 =?us-ascii?Q?Bcsb3JAsX7aJJneNhMumNi2vtiOBayihe23yrtDS8y5zvk81aSNi2R+Ius8c?=
 =?us-ascii?Q?IPOBH612DDyaZQqBZPAzfY+HD42JqIwFo1iB2svMj4zuuv9M8ZI5WR0MctIU?=
 =?us-ascii?Q?NYCbf6fl0Jg6xdYdZJq0WBuZeoN76jI5Gc7baltUv0rl+jQCtDfSMR9g4TkW?=
 =?us-ascii?Q?0IQIBQM+kCgVvxmoWIGVJEcWEVz20jivWlBkzCPyMIpr1Ha5iv8koPaYE01N?=
 =?us-ascii?Q?LK8stFhP8h0SlbcQRBWl920iE+Tg7+FEg/eDProa3fMoiElWuQy33Han1ayP?=
 =?us-ascii?Q?x5Lxlc1hKF9+9eUL+EkZfigaZEsraALU2tnGLq57jHJbZ28GPy3c2Ev22DvZ?=
 =?us-ascii?Q?gWlLncMrFDocq3BK+xMvZO5lgONCboOLMgCE+AEBbc/3Pmn/3nBzmfRqbj37?=
 =?us-ascii?Q?dAZbRyDBWYpK4hlNZGtbYPDUWCw8pbWuBHTC/kcw563VX/xrV9v2KvQ/XXW3?=
 =?us-ascii?Q?rDD5bTZx6tfaV2FIuBAhVIDgbWvEqe0ocp/5ZUD2m28VU+AkUPDSMGf25mrZ?=
 =?us-ascii?Q?yWP1WqoulkYW3PXZKep+ZdHulf56VlZmG0XEIo9vMLt4uIJqZ2YhDysWn4G3?=
 =?us-ascii?Q?T7mZ8d9QddztXfYU0iYEfxBVsVWZtXKlnHoPXxEdUzjTX9mryyIMmz4inV0D?=
 =?us-ascii?Q?sisoXEhGCvg0I9vb2OVdnAsRj8SNbtB1Obe/kO+Nvz083pYB2WLh69SkW2Cx?=
 =?us-ascii?Q?qc/BtAJ5fad0DxhtuF3ZGwsC+VWQwTF6V/CqtZeG7B66urIzBPbNJM0f0V9v?=
 =?us-ascii?Q?yTLXaKcU52lXdLYBNnAOBF/0xSZtbuT6QvluqP94jH13cAIjdNj44bMXroRD?=
 =?us-ascii?Q?9U0fOGxPdY0VL+fpseD3X+ifZDrzYD7FnqWqnm0W5SW7zVS3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb5afeb-a42e-469c-5957-08de63853b9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 00:35:01.4687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h9e0VdTzg25DD5pQfKxx7gOnNeGvuaiDVxsu5wEVQuNnAmg4CjLHopQquGgVLlsKT1kJWlkXcOMSS3A8fC//Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8976
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux-watchdog.org,roeck-us.net,pengutronix.de,gmail.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,nxp.com];
	TAGGED_FROM(0.00)[bounces-4897-lists,linux-watchdog=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@nxp.com,linux-watchdog@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-watchdog];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,PAXPR04MB8459.eurprd04.prod.outlook.com:mid,nxp.com:email,nxp.com:dkim]
X-Rspamd-Queue-Id: 16595E00CA
X-Rspamd-Action: no action

> Subject: Re: [PATCH] watchdog: imx7ulp_wdt: Keep WDOG running
> until A55 enters WFI on i.MX94
>=20
> On Tue, Feb 03, 2026 at 04:05:47PM +0800, Peng Fan (OSS) wrote:
> > From: Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
> >
> > On i.MX94, watchdog sources clock from bus clock that will be
> always
> > on during the lifecycle of Linux. There is a Low Power Clock
> > Gating(LPCG) between the bus clock and watchdog, but the LPCG is
> not
> > exported for software to control, it is hardware automatically
> > controlled. When
> > Cortex-A55 executes WFI during suspend flow, the LPCG will
> > automatically gate off the clock stop watchdog.
> >
> > So watchdog could always be alive to protect Linux, until WFI is
> executed.
>=20
> suppose only after suspend's WFI? suppose CPUIDLE's WFI doesn't
> affect it?

Only suspend WFI.=20

Regards
Peng.

>=20
> Frank
> >
> > Introduce a new hardware feature flag to indicate CPU low-power-
> mode
> > auto clock gating support, and use it to avoid stopping the watchdog
> > during suspend when LPCG can safely keep it running.
> >
> > Add i.MX94-specific watchdog hardware data and DT compatible
> entry to
> > enable this behavior.
> >
> > Signed-off-by: Ranjani Vaidyanathan
> <ranjani.vaidyanathan@nxp.com>
> > [peng.fan@nxp.com: rewrite commit log for clarity]
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/watchdog/imx7ulp_wdt.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/watchdog/imx7ulp_wdt.c
> > b/drivers/watchdog/imx7ulp_wdt.c index
> >
> 03479110453ce78a6a89ce8d351ba9ece2f5e2c5..0ae4c0c00138e8985
> 4f14edca0fd
> > 5fa84591c2d2 100644
> > --- a/drivers/watchdog/imx7ulp_wdt.c
> > +++ b/drivers/watchdog/imx7ulp_wdt.c
> > @@ -56,6 +56,7 @@ MODULE_PARM_DESC(nowayout, "Watchdog
> cannot be stopped once started (default=3D"
> >  struct imx_wdt_hw_feature {
> >  	bool prescaler_enable;
> >  	bool post_rcs_wait;
> > +	bool cpu_lpm_auto_cg;
> >  	u32 wdog_clock_rate;
> >  };
> >
> > @@ -360,7 +361,8 @@ static int __maybe_unused
> > imx7ulp_wdt_suspend_noirq(struct device *dev)  {
> >  	struct imx7ulp_wdt_device *imx7ulp_wdt =3D
> dev_get_drvdata(dev);
> >
> > -	if (watchdog_active(&imx7ulp_wdt->wdd))
> > +
> > +	if (watchdog_active(&imx7ulp_wdt->wdd) &&
> > +!imx7ulp_wdt->hw->cpu_lpm_auto_cg)
> >  		imx7ulp_wdt_stop(&imx7ulp_wdt->wdd);
> >
> >  	clk_disable_unprepare(imx7ulp_wdt->clk);
> > @@ -408,10 +410,17 @@ static const struct imx_wdt_hw_feature
> imx93_wdt_hw =3D {
> >  	.wdog_clock_rate =3D 125,
> >  };
> >
> > +static const struct imx_wdt_hw_feature imx94_wdt_hw =3D {
> > +	.prescaler_enable =3D true,
> > +	.wdog_clock_rate =3D 125,
> > +	.cpu_lpm_auto_cg =3D true,
> > +};
> > +
> >  static const struct of_device_id imx7ulp_wdt_dt_ids[] =3D {
> >  	{ .compatible =3D "fsl,imx7ulp-wdt", .data =3D &imx7ulp_wdt_hw, },
> >  	{ .compatible =3D "fsl,imx8ulp-wdt", .data =3D &imx8ulp_wdt_hw, },
> >  	{ .compatible =3D "fsl,imx93-wdt", .data =3D &imx93_wdt_hw, },
> > +	{ .compatible =3D "fsl,imx94-wdt", .data =3D &imx94_wdt_hw, },
> >  	{ /* sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, imx7ulp_wdt_dt_ids);
> >
> > ---
> > base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
> > change-id: 20260203-imx94-wdog-1e0aa14d661b
> >
> > Best regards,
> > --
> > Peng Fan <peng.fan@nxp.com>
> >


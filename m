Return-Path: <linux-watchdog+bounces-3065-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6D8A54A8A
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Mar 2025 13:20:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E570D188C792
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Mar 2025 12:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4142C20968E;
	Thu,  6 Mar 2025 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="CpLzMJKp"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABCD1853;
	Thu,  6 Mar 2025 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741263614; cv=fail; b=N6gARQ2ie/Q5W8P0y+MfgbHHZ30fBCY/kEl5ZVutVkaN6xTkFZ1YmjgSCgmRNGnhoGXeHaJQe4vbLXQSC2PCIv5QtP44B29i6uoDVqGQUlaXwArxFsUUSctclxhk9DxifPG8UzZQvAXo990U6+PCLqlAX0BSEefwxGb/Uvy2150=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741263614; c=relaxed/simple;
	bh=bI/vYfHoBjGHBnR4sO0HMWmgaNemblj2cfNLpZclL4w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=KwPzboIK4DwqOb7xE9caPyeamiOruCHsP0witGWzdr0/K/WVTcJfuYnAQ1JDFiP/5nzx+eoVleCnV4YuTg+ommMNQIEdfm5RHDauf7sOYxFoPYC+I2IOqcUtZXoL7w8WoeCOyB3rmGpkCP09tjpOfdgPGtQrVke9n8pi2q9K5+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=CpLzMJKp; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5269IOJi018197;
	Thu, 6 Mar 2025 04:18:23 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2044.outbound.protection.outlook.com [104.47.51.44])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4578y689n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 04:18:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h6yQFiNhuWUqSEHgQXloSAqFUc2ZzFVkbXGoUALV6EL+OjoOlvZpNZBO1ONa0H4JQNaxymW5/GZZOUAMCeNPF6Oy5Rp1eMPuaRTAShg0H1v77aIktLIOtv8dmU7r3hk3yG7z6uxTic54bAIADOEJi98CTnwvZcMCNomf6ikXnxgP6yXxkrEvlZZmocxl81To/lIxkZjv1085XDD0LUx/ejdFP1aTmdqS+5Q16LaHXz2ngjo7juytMvikvgYslHwhMLm6rh1uL7QnwTxTLEDrPBQ8RvcVwcy6xJh4QwIdDr+5TTeX3UxI5H40+k0yKOhUkATbDRFgJsaK1sR8iZDOYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bI/vYfHoBjGHBnR4sO0HMWmgaNemblj2cfNLpZclL4w=;
 b=HfWApH4T0biLN+ezAd2RFnTYTLCldnAqQLseVcggHllzGMURIWFSBv4PFcD743H289XMf8QrOrfp6jgZvGMUTgZyvNkaW8kMIb20Zvu+KWn2kM9I6ER+GnEZXW/DuGW6WHdJgs6THK2lmj/a7GJjM1PIaEAb1XM7A4ghM3lR3vUb/2TYV27K40X2aT2fSx2qO1eGp/8ZjQdsRYIzJ0ItTixQDzCQcPF39Y13oUcR4PWOme1ohXCLUVa9nwtxu8lPuBqcWPwO6ke3wjI2UpvmySTdkmHqAKNyOGWq8ju9wxeWqVdLXo0LTyDFVWsF6LTgZCOQdksYKdilNhdE00MOvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bI/vYfHoBjGHBnR4sO0HMWmgaNemblj2cfNLpZclL4w=;
 b=CpLzMJKp/nnxT9DuwDf+zVFgb5DZOol+QKz24bGez/Usc3IC3i0i71cbC1PDV6VPJe6fnj8vfq048yR7ac8DEo3hXejX9mySwAJjc6cdxylx6THjyunQOmXvoPHgwxPbBTD8lEzLA9C5YR19T1vlfjQYHKqAVuZocuxhzhLq+68=
Received: from PH8PR18MB5381.namprd18.prod.outlook.com (2603:10b6:510:254::16)
 by LV8PR18MB5853.namprd18.prod.outlook.com (2603:10b6:408:229::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 12:18:20 +0000
Received: from PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a]) by PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a%6]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 12:18:20 +0000
From: George Cherian <gcherian@marvell.com>
To: Guenter Roeck <linux@roeck-us.net>, Ahmad Fatoum <a.fatoum@pengutronix.de>
CC: "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "jwerner@chromium.org"
	<jwerner@chromium.org>,
        "evanbenn@chromium.org" <evanbenn@chromium.org>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "mazziesaccount@gmail.com"
	<mazziesaccount@gmail.com>,
        "thomas.richard@bootlin.com"
	<thomas.richard@bootlin.com>,
        "lma@chromium.org" <lma@chromium.org>,
        "bleung@chromium.org" <bleung@chromium.org>,
        "support.opensource@diasemi.com"
	<support.opensource@diasemi.com>,
        "shawnguo@kernel.org"
	<shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com"
	<festevam@gmail.com>,
        "andy@kernel.org" <andy@kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "alexander.usyskin@intel.com"
	<alexander.usyskin@intel.com>,
        "andreas.werner@men.de"
	<andreas.werner@men.de>,
        "daniel@thingy.jp" <daniel@thingy.jp>,
        "romain.perier@gmail.com" <romain.perier@gmail.com>,
        "avifishman70@gmail.com"
	<avifishman70@gmail.com>,
        "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
        "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
        "venture@google.com"
	<venture@google.com>,
        "yuenn@google.com" <yuenn@google.com>,
        "benjaminfair@google.com" <benjaminfair@google.com>,
        "maddy@linux.ibm.com"
	<maddy@linux.ibm.com>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "npiggin@gmail.com" <npiggin@gmail.com>,
        "christophe.leroy@csgroup.eu"
	<christophe.leroy@csgroup.eu>,
        "naveen@kernel.org" <naveen@kernel.org>,
        "mwalle@kernel.org" <mwalle@kernel.org>,
        "xingyu.wu@starfivetech.com"
	<xingyu.wu@starfivetech.com>,
        "ziv.xu@starfivetech.com"
	<ziv.xu@starfivetech.com>,
        "hayashi.kunihiko@socionext.com"
	<hayashi.kunihiko@socionext.com>,
        "mhiramat@kernel.org"
	<mhiramat@kernel.org>,
        "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "chrome-platform@lists.linux.dev"
	<chrome-platform@lists.linux.dev>,
        "imx@lists.linux.dev"
	<imx@lists.linux.dev>,
        "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>,
        "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>,
        "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>,
        "patches@opensource.cirrus.com"
	<patches@opensource.cirrus.com>,
        =?utf-8?B?TWFyZWsgQmVow7pu?=
	<kabel@kernel.org>
Subject: RE: [EXTERNAL] Re: [PATCH v4 1/2] watchdog: Add a new flag
 WDIOF_STOP_MAYSLEEP
Thread-Topic: [EXTERNAL] Re: [PATCH v4 1/2] watchdog: Add a new flag
 WDIOF_STOP_MAYSLEEP
Thread-Index: AQHbjbo52JxREBNQ6UqbD0W7rj3cQ7NkYIyAgADZCACAAKNX8A==
Date: Thu, 6 Mar 2025 12:18:20 +0000
Message-ID:
 <PH8PR18MB53812FCAE180303E5D434275C5CA2@PH8PR18MB5381.namprd18.prod.outlook.com>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
 <irmewriceyzxr6jvbiao5vqrvelpftbjalmheodx5w63zi6k2y@dg3wlvs6zryd>
 <PH8PR18MB538122CE6706872B8A836A94C5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
 <7ac2b8db-22c7-4168-b1b7-4f9f0ab10531@pengutronix.de>
 <28a711e5-b2cb-4d5f-bb78-259a01cd4bcc@roeck-us.net>
In-Reply-To: <28a711e5-b2cb-4d5f-bb78-259a01cd4bcc@roeck-us.net>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR18MB5381:EE_|LV8PR18MB5853:EE_
x-ms-office365-filtering-correlation-id: 20f72153-0aed-48b4-5191-08dd5ca8fb8e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?d05Jb0xrdUdSTDhwVVlPWitVcUNFSkhPUU8vRERmMksxNFAvWk1NNk5LTm1O?=
 =?utf-8?B?MWtQU21raENXeHRzUW5XdkJSSWZCMTVMaXFYZHd3RFdDRHFLUGQ2eHozMytv?=
 =?utf-8?B?RSs5T29uZ1V6SVNsRjdoUDhIQW1xVVVod1Q3eDhibEpRenhlcy8zUGh6cWpN?=
 =?utf-8?B?RkFrWmY5M0dIV0J2dDNoUHBONkk4eVE1Mktpd2RwWDNVd01wamN4VDlsN29q?=
 =?utf-8?B?Y3hXZVRtV2h5Z2U4UGNPSjFhWDRpRUVkY0t0VStid0xMVU1NRlhod3dNUGZG?=
 =?utf-8?B?OGZUNEhRZURmUU1yeEFIbmU5dVZTTGNkUUc1clBBK0tqUzlSVUUzZVZWTVZn?=
 =?utf-8?B?N3h0UC9MWXAwVFVFRFdQU2pDMmZFRjE2aGdKeFNDMHhTUkxSWDNsYmZ0T25h?=
 =?utf-8?B?T1lZNXpYa1BseEgxSGNKbmRkT01yZk1WWCtya1MzdmFiR2xDbkhJVHJYZWpP?=
 =?utf-8?B?bmp0TGRwNEthVVdDOEppZzRZcStyRVFadWhSQUtiNDNzck5GZjZDc0JmSk9K?=
 =?utf-8?B?ck05OTJxRGkxTnUyejk4ZHdGbndjN3U2dkRGUWpJYlYwUllDSTRPNlRhM2tz?=
 =?utf-8?B?NmdDaUFRVHRWS1Z1YzgwVDhrN1JURXVLRTlvZDY0ZkZ5NFRvV29MVXllc01v?=
 =?utf-8?B?eWFqNjNxMENmVUlqUENvV05lbENoRTBtTmRQeFlxWUhYaWh1aVhrLzRGOVUw?=
 =?utf-8?B?YVBXdTVKUTFvUWtjOTM5VVBtTnZlNEhTd2MzSHBsV1lkdDdEbXVDYmJwdkJI?=
 =?utf-8?B?NUV6MUlvNmRmd3RWK09lWVBQQ0twQ2JjQ0dzaDFIdTVEVXRua1Z1ZW00NHoy?=
 =?utf-8?B?ZWp4Q1VlYm43M2xrRlpabjdQeWNPdWpNbnVmOENxS1k3U2E4RUQwL0FaOCs3?=
 =?utf-8?B?R1E1T2tPcDh6ekQwZS9NWDdlbExwS05sSmNYZ1VVUmM2NDRiQ3A5TWtkSmhD?=
 =?utf-8?B?UUw4bXVlMWtRdEVCU0g3N2E2U1lGOVpDMjJpTGlUdThsRDVxbFFyK3hoVGEy?=
 =?utf-8?B?N2hYbXd2MXkxZ2d2bzRIOUU4TlBGTjJ4V2I2d1daVmdiVktyNkYvcTJmOWJl?=
 =?utf-8?B?SWovenc4MXZ1YmlqTU5LMldla3FoV25RT01URzZSTm1wa0NyVkFiQ1RJeWxJ?=
 =?utf-8?B?WnB5MVlZbUp6OU1XOXdwRTAzSXlDQ3YyTzNjc04zT2Zuc2YwUSt5QSt0ZDlY?=
 =?utf-8?B?UUkvRWc0dGtBQStvZVUyUERZaXJoRUlwZDdrRTdtQXZ2bTg1Z2hQdC9xcnhm?=
 =?utf-8?B?R051NHNKTzc4aHRweWxwZDlOdGdKdnNLcll0ZVh1R2tpSjNBcW1YcTBpQkUx?=
 =?utf-8?B?OUR3YllKelE3dXpCTWFoS1VkMFVwa0NWNUpzVkU2L0hsZk1UL1Q0ZjYvem0r?=
 =?utf-8?B?Wm9SYS9yU2pkUytUc1Y0eFJIaEt3cjZ6cFFmdFI1ZkVyWFpJeDFMYjE0K1pW?=
 =?utf-8?B?eVhnQlNzUHZ6K3pUWjRtbzdRMTN3WktqYXZJUmJHckpGKytLaEgweDNYNWxO?=
 =?utf-8?B?cThnR252MDdNME56WXplOUdBVXQ4WHVRTTdEaWFWSklpdnNuTkV0OVVuSzVX?=
 =?utf-8?B?dW9lVFFhUk5mK2E4RDY5R1RaZDBCV0g3MzRMYytHaWE1TDdlTGoxSXhFaW5m?=
 =?utf-8?B?UUwwZ0dSTUtPc3FGeE9ZeGZaZTlhZWpQMUhncCsyK2hqZ0lMTlpNVTRFbjJS?=
 =?utf-8?B?OFMyWTV6QmFwTnVqeU0rMllFNDBpK1k4THZRcElGQnI1dVYwd1hNckhhTnd6?=
 =?utf-8?B?WXNBc2YxYVpkT2FoZFM2azdwTExIanNDSGJXQU9Tb1l4MDg4ZVNDVHZ0Zjgv?=
 =?utf-8?B?NkxCcTZLanllWElveHF5c0w3Yks4V0VQeWZ6dGN5aFpDUzhjNDJmUTRpZTJW?=
 =?utf-8?B?VFJwZGFhdTdLQXRDS3hMaGRDVDhJeWtPQmk4YzVpVFRTQTNMbUlIQU1OWmJO?=
 =?utf-8?Q?TRRupLogl27sN9WenKxRhVGeQJLw26dR?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR18MB5381.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZE1rVWZyTm53QnZGbXVyMThZRXlBQ3NXM0dDbXcrRXpUa29scmVYYjIrajND?=
 =?utf-8?B?a1lVTExOLzhuZjgyemtHRmRKdWplcUF5ajI0b08rM3VTdW9rQ2EzSUdyQTh6?=
 =?utf-8?B?ZDRCc0p1VlJpOXJZbkNNWmxuZU4yWm4wOU1Kd2pTVG1zb2dyNUNJTFpJYUVX?=
 =?utf-8?B?S29ycFJOS0lhVWgwbFpYaFdlZnh0U2JSVUs0UFJvZk5pMDFRVzJXTFk4V25h?=
 =?utf-8?B?S0NKWnZlRC9qS3lWRXN4Ry9hb2tDckxmeFo0QTdTd0NYc1hUMFZPcklsMUY4?=
 =?utf-8?B?WklnTTN3TzJOQUVnSjFjLzIxK3lhbTlJWTdKYWxSbzFod2dLN2R6U01vdEh5?=
 =?utf-8?B?VFREUWpGR3FJVFRmVXp6TzJmZzh1dHJUR1hlY2RIWGlpM1dzYituR3BVL2Fa?=
 =?utf-8?B?U0xUeWRNQ3JoZjdWUnhzc2FYZkVidnJraUNNVEg0QkJydGxpTCtsZDk3YUdU?=
 =?utf-8?B?VG9VbzZUWlY4VHlOaUVqRE9LV3FxQzhZakl2VzExRC9Wd3FvNTFvYjFoT1U1?=
 =?utf-8?B?NmEvYmQ2cjUzUmJUbHZ6L0FwNEJZQVJHZmpsMEh1T0lzckduVmZqTVp3WkxS?=
 =?utf-8?B?Y1dEME0wWEZ3Q1FtV3BhMXI2eGhBN3VMbm8yYXVKZWhENmhzdWJGUkNocEcv?=
 =?utf-8?B?blhuNk5ySFE5bHE2OVBBeGduM1ZpKy9Jb1hXQW0xYmxZanp2NVZ1N1VWZjgr?=
 =?utf-8?B?Z0J0TjVQRk9JWjdUM3ZnS2MxSFQySmw3QWRhMXV5ZlFkeXVRTDVRNXA2T1ZH?=
 =?utf-8?B?T1Fhd3luM2tRU0JhZjNhVWhuaHJoWDluODZSYmgrOWQ5THVIUEVPVTdkM2Fm?=
 =?utf-8?B?UjB6V2Z5dzJMdWhiK3hvZDBISHU2b2lnbzVFRUZQYm1XSEhpMnFsVFQ2K1Mz?=
 =?utf-8?B?WlpUa3d3WWJBM25LMy9teHYxMnlOUlFFMWpCZDNlbVpEcFlzSVlDOHk3Nk9L?=
 =?utf-8?B?TzZCaW1YMXo3ditvUWwyTEJWRkdRdUNUWGk5ZktQMWJCSVFHUUppWjMrYzZI?=
 =?utf-8?B?cWRmOVNlY1JGQVQvK0laNDE2TUlkVGVwalVmcTZFQnBaaUZEN213eFMvOERN?=
 =?utf-8?B?R3FSWmVWUG1oS1llelhycTV4cnBweGlZc3k1K2M1eTZhMW5qRVZjU1A1NUR5?=
 =?utf-8?B?TkoxQnBNaHhzL2x1bS96dmVLd2hhZGo4K3c4SDFCU2JXbTRINlFub2RBaS9v?=
 =?utf-8?B?ZTFpR25EY0ZkMGNXU0F2N0hDQTJneEFRMTFlcjZEK0EreGZla3lTZmVZaUlZ?=
 =?utf-8?B?MlkwUDhlWmYyMXByS0N3eElJTHNoNVFUTnZtcmJzemZKeVk2cFg1Wk9kNlBF?=
 =?utf-8?B?REo2RCtFd04xckI3dW0wcHdaWURZSXBtdTdhZ3YwLy8yVG44dnBnc1FtaWZQ?=
 =?utf-8?B?cm0ydWJoVGhORTE1QWYzT1pxS2ZoUkpPVk1TVUFjaGMxK2UxM3Q1bVl0a3la?=
 =?utf-8?B?Snk0OVE0MUlNWEIxTy83UmxsVWpwQ2hGOHBPaXhBWmJ5TVVFQkhYOHdoV25h?=
 =?utf-8?B?aW4xVlA4N1Npb0pDdDMzbHFvaHBITW9YTzhoK3BnbFBtd3V2cWlNZHkvZjVZ?=
 =?utf-8?B?SUd0blp6TGxsek1RU3B0b3hBcGhsY3JVcWFLcksva0tSZmcrVmtSYm5EUHc0?=
 =?utf-8?B?UmZGTnhjK0lIL054OTB3WmYwTTRWZXFTN0VmOFRZTjZRc2hKQStidG15M1ZN?=
 =?utf-8?B?cVhaL3ZoZ2Rqdkp2T2lSTTg5MjE0K0dFeXRScG1JTi82TkowQnNZUXpYL2hY?=
 =?utf-8?B?cDJ5R0lUTysxRXpZQUJNTE1vYWp3bkx4R0NBRHBGN21obFM5OXBOeTk3cy9M?=
 =?utf-8?B?aEh5VTMxdjJIcHpSWURoMEk5eUE5ekZHUFdmTlRGRVBpY1Zyb3BvM0NUcnJB?=
 =?utf-8?B?dW15YjR1d3hlM1NuVEdlanBMQW9QaG9WT1dPR2R0MUF2RFpmMkVzcFZtcDVl?=
 =?utf-8?B?YlF6bjdxTFVZZVEvdlA0TzFOUFhZcWU5bnBSSklJYm5BeExkYUllOExpY1dZ?=
 =?utf-8?B?eTFOU2pBRVF1ZE9pLzhXVm1qSjAyLzRHNnI3aXpxK3ZKUG5uYWs3SWtnb1d5?=
 =?utf-8?B?TUhTL0R4WW5rZ1ZtQ3ROYzVMV3ZVMWFrdTlNVGRCczlVNDJDNW1YeHl3V1RP?=
 =?utf-8?Q?Ji37Y6tOFOkdNzRl75KFXzYxN?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR18MB5381.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f72153-0aed-48b4-5191-08dd5ca8fb8e
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2025 12:18:20.0658
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rudFcUnxiUsNfQpV0naMCAjbfaKYLwXR4k4Tm+bzbTZNLavH2SmpraUmWLD79Bi9KuvvPY2lpA69o6yE8r3oMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR18MB5853
X-Authority-Analysis: v=2.4 cv=cesormDM c=1 sm=1 tr=0 ts=67c9928e cx=c_pps a=E4Q64eWPmlOcdHW0GAz4hQ==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Vs1iUdzkB0EA:10 a=-AAbraWEqlQA:10 a=-m1FPHAAd9JJ1ULUGqgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: KtKfxDEsJWiJiI3yg4oTp4dNVTMAtHun
X-Proofpoint-ORIG-GUID: KtKfxDEsJWiJiI3yg4oTp4dNVTMAtHun
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01

SGkgR3VlbnRlciwNCg0KSSBhbSBzdW1tYXJpemluZyB0aGUgdG9waWNzIHdlIGRpc2N1c3NlZCBp
biBtdWx0aXBsZSB0aHJlYWRzIGhlcmUuDQoNCj4+T24gMy81LzI1IDAzOjAxLCBBaG1hZCBGYXRv
dW0gd3JvdGU6DQo+PiBIaSBHZW9yZ2UsDQo+PiBIaSBHdWVudGVyLA0KPj4gDQo+PiBPbiAwNS4w
My4yNSAxMTozNCwgR2VvcmdlIENoZXJpYW4gd3JvdGU6DQo+Pj4+IHdoeSBpcyBhcm1hZGFfMzd4
eF93ZHQgYWxzbyBoZXJlPw0KPj4+PiBUaGUgc3RvcCBmdW5jdGlvbiBpbiB0aGF0IGRyaXZlciBt
YXkgbm90IHNsZWVwLg0KPj4+IE1hcmVrLA0KPj4+DQo+Pj4gVGhhbmtzIGZvciByZXZpZXdpbmcu
DQo+Pj4gU2luY2UgdGhlIHN0b3AgZnVuY3Rpb24gaGFzIGEgcmVnbWFwX3dyaXRlKCksIEkgdGhv
dWdodCBpdCBtaWdodCBzbGVlcC4NCj4+PiBOb3cgdGhhdCB5b3UgcG9pbnRlZCBpdCBvdXQsIEkg
YXNzdW1lIHRoYXQgaXQgaXMgYW4gTU1JTyBiYXNlZCByZWdtYXAgYmVpbmcgdXNlZCBmb3IgYXJt
YWRhLg0KPj4+IEkgd2lsbCB1cGRhdGUgdGhlIHNhbWUgaW4gdGhlIG5leHQgdmVyc2lvbg0KPj4g
DQo+PiBGYWlsdXJlIHRvIGFkZCBXRElPRl9TVE9QX01BWVNMRUVQIHdoZW4gaXQncyBuZWVkZWQg
Y2FuIGxlYWQgdG8NCj4+IGtlcm5lbCBoYW5naW5nLiBGYWlsdXJlIHRvIGFkZCBhbiBhbHRlcm5h
dGl2ZSBXRElPRl9TVE9QX0FUT01JQw0KPj4gd291bGQgbGVhZCB0byB0aGUga2VybmVsIG9wdGlv
biBiZWluZyBhIG5vLW9wLg0KPj4gDQo+PiBJIHRoaW5rIGEgbm8tb3Agc3RvcF9vbl9wYW5pYyAo
b3IgcmVzZXRfb25fcGFuaWMpIGlzIGEgc2FuZXIgZGVmYXVsdC4NCj4+IA0KPg0KPkFncmVlZC4g
QWxzbywgSSBsaWtlIFdESU9GX1NUT1BfQVRPTUlDIG1vcmUgdGhhbiB0aGUgV0RJT0ZfU1RPUF9O
T1NMRUVQDQo+SSBoYWQgc3VnZ2VzdGVkIGluIG15IG90aGVyIHJlc3BvbnNlLg0KDQoxLiBJbnN0
ZWFkIG9mIGJsYWNrbGlzdGluZyBkcml2ZXJzIGFzIFdESU9GX1NUT1BfTUFZU0xFRVAsIHRoZSBv
cHRpb24gd2lsbCBhbiBvcHQtaW4uDQoyLiBUaGlzIG1heSBub3QgYmUgV0RJT0ZfU1RPUF9BT01J
QywgaW5zdGVhZCB3b3VsZCBiZSBhIGdlbmVyaWMgZmxhZyBub3QgbGltaXRlZCB0byBTVE9QDQog
ICAgb3BlcmF0aW9uLiBNYXkgYmUgV0RJT0ZfT1BTX0FUT01JQyAoT1BTIGluY2x1ZGUgLSAuc3Rh
cnQsIC5zdG9wLCAuc2V0X3RpbWVvdXQsIC5waW5nKQ0KMy4gUmVtb3ZlIHRoZSBrZXJuZWwgY29t
bWFuZCBsaW5lIG9wdGlvbiAoc3RvcF9vbl9wYW5pYykgYW5kIGhhdmUgYSBnZW5lcmljIHJlc2V0
X29uX3BhbmljLg0KNC4gcmVzZXRfb25fcGFuaWM9NjAgKGJ5IGRlZmF1bHQgKSAgbWVhbmluZyBv
biBhIHBhbmljIHRoZSB3ZG9nIHRpbWVvdXQgaXMgdXBkYXRlZCB0byA2MHNlYw0KICAgICBvciB0
aGUgY2xhbXBfdChyZXNldF9vbl9wYW5pYywgbWluLCBtYXhfaHdfaGVhcnRiZWF0X21zKS4NCjUu
IGlmIHJlc2V0X29uX3BhbmljPTAsIGl0IG1lYW5zIHRoZSB3YXRjaGRvZyBpcyBzdG9wcGVkIG9u
IHBhbmljLg0KNi4gQWxsIG9mIHRoZXNlIHRvIGJlIGRvbmUgYnkgZGVmYXVsdCBmcm9tIHBhbmlj
IGhhbmRsZXIgaW5jYXNlIG9mIGEgY29uZmlndXJlZCBrZHVtcCBrZXJuZWwuDQoNCi1HZW9yZ2UN
Cg0KPg0KPlRoYW5rcywNCj5HdWVudGVyDQoNCg==


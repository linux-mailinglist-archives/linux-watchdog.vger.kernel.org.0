Return-Path: <linux-watchdog+bounces-2989-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09936A41465
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Feb 2025 05:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E994516F7B0
	for <lists+linux-watchdog@lfdr.de>; Mon, 24 Feb 2025 04:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F9C61A5B89;
	Mon, 24 Feb 2025 04:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="rJ74KRm6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E648194C61;
	Mon, 24 Feb 2025 04:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740370222; cv=fail; b=K3xnOcUOaGf23HncEGQxwtJJuGg8HkOiTXzL2Q8bSaaUJBzcJoMUgSkU+FzHmLnFb1KDLb0gxsglcB9ZqLXpoQ80bhN513KyPHC0BDfz3+ALlfci65JAIB8DF1TNMcz+XeDPWnfxFiggG6/lOfNJ6idg38zKaXk1jAZeDeEoPMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740370222; c=relaxed/simple;
	bh=gpgVJ0gyZ9ugHko5u0Ge92pZpxqeJl06AvglUoq/JHU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=COOMmJj8oGpsgDwuKYpc4WizVL8J3p6AXDRN6/zHvk4X8o6bia/UwGdszctO3Z7YH6N9LvMfOENGX3InUbSFfNpTKGOQYb7wjrUMiAcHpy7Q6TKM6ufdJkzmFSl08LwBdVHonH34EYpMA3ysn5/d0uhdIwS5eyiUZapFD1G5Kpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=rJ74KRm6; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51O0RgIP020499;
	Sun, 23 Feb 2025 20:10:04 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 44yeyktnj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Feb 2025 20:10:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLSzqsOLs3e+nyRzj1KdoPoRt3cg5wdMZ6JUW13TzMy7Diw31FT6KPnbDoKfhf2c1g2IGoL03TmW14D2agdHhY46hLW/hIdZeG8bQ57yQ/MihTU6NxmUXldrHBV+KlDT1f5iIf/wLtEdWcaD/2tjADy+VluVxnao6W/vTPiTNqFgrkDZXaAeYYuWQTLEcbCtgdLgf72onOkQpSfJYDSt5HlGY6BwriEYLZG17XyHCA4au0E4ju57GGoUw+VUcv7pK+c5kSY4ofAFughlSQPgG/NhA1peFBv8xyafNEcqnNTBQtDDy5gdOfeBEL6oL1D44zMzpg9194LDbcIinmf1yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpgVJ0gyZ9ugHko5u0Ge92pZpxqeJl06AvglUoq/JHU=;
 b=CBCw9Ej4gbs1c+35MZZzb3RqIGqgzXxYw1a/BDb3q1c9LQ0ekbDHNcbWtV6ITsT4N/SvDLo0O73HB/uk5sIHpfxz8kTojQDfO1r2y7w7iXUPetnVrBWFVqs4GDw4LchHk6TMnjyJi8Ex13gWnd1eBlkGuyEdYAw0tWz6bKhGCmQn4ymY9rcnMYCYDabyglAR0q39UgcXxmwkOIkSErjgmXEtX+bW7b28KnZfuO3qkPcyQWRnScazEl40+0QCjHEkOPbW31Hs5WPxR9/nyMYA6NCe+ftKFHWdw06po9iPdlYMjkvDa2klBWSKTS7wNvCWh3PShBBOyGAYjHCx367OYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpgVJ0gyZ9ugHko5u0Ge92pZpxqeJl06AvglUoq/JHU=;
 b=rJ74KRm6a517924xzq4R2F6GjkoCG23/wz8K9ecFqnPpCOq5SKCtlfsx2B8SO5Zi5JD2YWEE/KUm0bTiihqYeaelPPhVqXw1Obsx8LCM0MD+6cnYu0DpxUXGBzBkWhJGVC5km/W4mTZXxVN1AeKW9tuQkpFz1I3VXQiuUOKt/9o=
Received: from PH8PR18MB5381.namprd18.prod.outlook.com (2603:10b6:510:254::16)
 by CH0PR18MB4129.namprd18.prod.outlook.com (2603:10b6:610:e0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 04:09:56 +0000
Received: from PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a]) by PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a%6]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 04:09:56 +0000
From: George Cherian <gcherian@marvell.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>,
        "corbet@lwn.net" <corbet@lwn.net>
CC: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drivers: watchdog: Add support for panic notifier
 callback
Thread-Topic: [PATCH 1/2] drivers: watchdog: Add support for panic notifier
 callback
Thread-Index: AQHbhnH2l3rBz0S5F0umniIfqHnSbg==
Date: Mon, 24 Feb 2025 04:09:56 +0000
Message-ID:
 <PH8PR18MB5381097A3ED6F33635EA9DDFC5C02@PH8PR18MB5381.namprd18.prod.outlook.com>
References: <20250221023550.2092232-1-george.cherian@marvell.com>
 <753aca13-e576-4784-80a5-ab8c21e92148@roeck-us.net>
In-Reply-To: <753aca13-e576-4784-80a5-ab8c21e92148@roeck-us.net>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR18MB5381:EE_|CH0PR18MB4129:EE_
x-ms-office365-filtering-correlation-id: d29d4e58-501e-4ad3-981e-08dd54891942
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?R0lndGFTMkpXbjM5UDRSSUtaRndOajNTb0Rjek9jYUVYSVJPUFFRSUQ3QWZL?=
 =?utf-8?B?SFpxVHFIb3VlcVFvK0o2aUxuYWtzTit1UkdTOGl4cHI1b2xFVnBmM0RLRU1s?=
 =?utf-8?B?Qk5WTTNOMGNrQzVZTFZRZkNTN2RiUUFmYWErR0IzKzJ6UWg2MGlMZ1BGTFl1?=
 =?utf-8?B?Y3lLMU0wSjZTRVh2Nnp3QjRrOVd2MzhKZVlBd0lETkZDZ212NEo5Skx6NHdQ?=
 =?utf-8?B?aDFRRFYzcEg0ZzdDWlk4NzVMMjBFak5jb2VkQ0k4ZVZrTXYrZll2REhWRnEy?=
 =?utf-8?B?bStJSHc1SlAyZmRaazNUTERMN2NuaHh3STBNZGFoMUcyNXgxUlo1RU1iNFB6?=
 =?utf-8?B?dmdPL2IvZWFWazN5TVVQeUVXcTZaUTYwM05iOWR6V2c0cnVzMVRzem9sZ3Vh?=
 =?utf-8?B?TzRMQkR6ay9tUzNzdG9vcEJDMzlEVG5VYTgyRG9Tb3JZck1PUk56U0Z0YW5Q?=
 =?utf-8?B?NFZMWW5JdVovYVB2dkhDL3ByMU5LOGE5UkYzNDc1bm5ZZGdCc256Qm1mT3NV?=
 =?utf-8?B?anE5c25RWWh0enk4anh2UGZadFFOQzZWQ2JzM3VNekFueE9NSURzZEpCNFhz?=
 =?utf-8?B?ZkVpRWR6Rkh5NmxsdVVKWjdyb3RsSVg1R3RzZUE5T1I5TFVUaENHTjFqM2tD?=
 =?utf-8?B?bGdZMkZPNGR2UHlsaHBsT0o5c3BDbXJnMm1VMnNLRklCL0tEd3czTUVlalVi?=
 =?utf-8?B?N0c4bUxhb0VHVjJjaFFIMVNJVnUwTVRhRUVNalVxVzJud0JpeWJ6bDNkVEps?=
 =?utf-8?B?MXAyazlXTENEdVBJd1pVb1JrbUNjd25YUlh5SzJTMXc1b2RBSnpBdzVOWlNK?=
 =?utf-8?B?OWhnTmVPUVNwcDZ1cncvcnVlQU1Hc0E4OVc3OVJmU1p1bDBlSUlLUnJ4K3pP?=
 =?utf-8?B?REZOdzc4UTc0VjVMdy93UGNvZnZib2laVVpGazFNRmthRUMrb0RtWEVacGJC?=
 =?utf-8?B?MkFMNHhiRXQ1T1A2eWdmcGlaOHlzZHRjcVNkTzJoenFwZEZCcW1yT2NBbVJj?=
 =?utf-8?B?ank0TUhpbGE2WjdTS29jNC96TzZQU2tRV0pvMWhhY0ZCczQ0ckdvVzNEM1FJ?=
 =?utf-8?B?aUJXa3VQTG5uZzB1SmxsMUxCaVFFWStET1NEWmVTZHlod1NZWTdiMnAyUVFa?=
 =?utf-8?B?cUZCZFcxblNSY1dTQnN2RDRNTUptOUN5NXJ2OEV3WDUzYnBrN2ZlUmZUcG5k?=
 =?utf-8?B?MVJrVnIrdkIzYWhaWUQwbk45K2lQQ0lNOEZ4Uk1tZUYxWDdVSVVGQVR6NWRo?=
 =?utf-8?B?WlhsUUpmSThyY2RRMVRMTjJzcHdGcWx5QkdGZXNneTVMbmxib3FPZFJIMXhL?=
 =?utf-8?B?cmpFN28wU3NJSWFMMk4rTDVSYWNYYmd0QnkzSHFMRXVUM1ZvRlJ1c3Jsbkx4?=
 =?utf-8?B?dlo3R05wQWw4ZUpYN1ZGSUZIcmhweTNENzhoKzcrekpXNWVXWmZFVjI4SDQx?=
 =?utf-8?B?UzBDd2RjZ0Z1NkI0TkpkS3lmQVh6dkcxa2dJTjFhcU5tT3h6OENLYU1UMjd4?=
 =?utf-8?B?cm1NYTlWSHN6LzVPSmpGUHJkVFR2UHkzcXFrdHJmUGswUmNQSUhxVnRidDZr?=
 =?utf-8?B?R2JXQVNXZldwRGx6V0wrYmN5eExSa0grNmw3aVh3Y3N2KzgrSUNselI2TGNB?=
 =?utf-8?B?SnVWSVhOMmdvai9CWXVJQXVlTUttQUpOSzBNMzNsa0RaaDBnajRoUENhWWF5?=
 =?utf-8?B?Ylh3OEdmWThETElaOXpxMGFZNkptVEU3WjQrcUpkaDY0Z0thUnN5aUFLZXA4?=
 =?utf-8?B?M1dzZDk4clhOUy91WURrMEV5bXpoTS9jbGl5blhJK1Nua3QvOVJycEpBZ0NJ?=
 =?utf-8?B?bytjM3grRnF3Y3dkWnp4WVp5cnF5bUFhOGc0ZVBZbWNTSGlxZEhCTjRCUHRO?=
 =?utf-8?B?NTI1dFJVaTIwWmlPajhLejI4a1lLRzhGaDhYdmNoRHN4RzlwVm5CbitweXJu?=
 =?utf-8?Q?YQSFGhi0A0BNXNbTljivz8DaVec/ghUV?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR18MB5381.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Vjd0TzJxRjNKNUxpRldMUlVSU0xRVnJGOUZkRE5ETlQvUnJrSXBPdWtQUlJj?=
 =?utf-8?B?ZVI2RVd5MlhnLzFUajJNdWpBS0RsbllDNjZ2cjA5S0ZMaFArMnUydkNwMlVG?=
 =?utf-8?B?VmFKakc5Tkhhcy8xZUYwd2xNcHB0d0p6RVAxemR0U0JidjNOOEg2Uk9SN0NV?=
 =?utf-8?B?ZnNUVVArMG5HUDNQU0xPaVZKUFg4cUk3UFFXczFlTDNQVHFobDgzVXNHampr?=
 =?utf-8?B?L2d3VzMxRFR2TWxTR3RBYmQ0a1pBSGJxbVM2TUtsZHdkaTBtMTBjV0RkejVp?=
 =?utf-8?B?Zmd2UmN1MFRLSnN5VldGNE1XaEJpOU5nbERJdE9GSm1BU09aaTFhMGlwY2J4?=
 =?utf-8?B?YzlNaWVsdXhKaGtWMzZ6Z0xyc2lJckJGTWhJSjhoaGlKSUN0bzdELy9obnNy?=
 =?utf-8?B?OUtmSVQ2QlMyWTloUDZaSUJtYStDaVdVRDN3c29TaURSSGF4WGhDaW80ZG1C?=
 =?utf-8?B?cnd6S0JYODVRRjRrayt6ZVh4ek5LSjVTL3NDbDFFNXlOUFN3RVZMYU95emZB?=
 =?utf-8?B?TnMrOUJrWElScGZCcCtLQTJySU1CbWtoR0dINWxlQ0tkaXRKQ1RkNmJEN2hM?=
 =?utf-8?B?VVhFK2pOWVEwWjQ4amtMV0ZkSGs3YzlYdVByRGRWaXJEY25wOFhjbE5jeS81?=
 =?utf-8?B?UzFtb04wb3cvd3RGUjh0SG5kR09iVVlLNkRNMjFXUms3MWZReU1WeFJMTkVW?=
 =?utf-8?B?SWJkU0t0OXVqSU40eThHbDJtak83UHF6UjBSTUsyWjFxRlBueTV3dW1XcmNE?=
 =?utf-8?B?Z3FBSGtnbTl3WXBXYW84eE84Z1lNZW90Ti9hVlprTnNrc3NDUENoQjVETlZU?=
 =?utf-8?B?aUJVTzUwNXhkUHhyVElPdEF1QzFjMWNRcXY1U2prZXVuMG82Y0Jud1UyWWpj?=
 =?utf-8?B?T254dWxoQkFXVUNRckRnTDd0N3hSKzZvL1EzWWN5Ky9FbVhuVWEzVEp1NDNR?=
 =?utf-8?B?WnJmMitMdUNGTkYzYXh4MUlUSCtXRkxFR1RLYkQzNWw3anlWUHM0RkREcFpO?=
 =?utf-8?B?ekRVTkgxY3A1UmRSb3BNWXhXYkpXSWlSc2FxeTZYYVROTnFXYnM3Q042clM5?=
 =?utf-8?B?elZQMjh6NXJvQ1VHYXhMamtiSDhxRlAxSitkY3NsclBnOVdWTUloYW4rMGpQ?=
 =?utf-8?B?S2V3Rll2cHRTczdTeTdlZHFLQ1FkZ3M1VkRYV3Uyc3FKaS90WVBXMHlBZjdF?=
 =?utf-8?B?bThybFFycEZ2eTQwUFIzcW8rNjY5aDhaRGcvRnZOb0cwRmJOWlBlZitlSkVF?=
 =?utf-8?B?Z0l3UkxLZzF3Y0NnTVdOT1pneUVIK2MyU1pwL3RxSDhnMVovT1l4U2s2ejhj?=
 =?utf-8?B?azVlN1VLRlZsODBSaVVqcG1PZzBMWGVnWEZyc1g3TFR2eWdUMUFTWlFkZGJW?=
 =?utf-8?B?Qll5Y2VmTlp6VE4zYnZkSXdmNjIrQk5zRXI2SGVvYk1Ka0FKa0gyTWwwQi9t?=
 =?utf-8?B?dFZkWVQwZC9veW1MMG9QUWRvdVJUbncwME13VGdnNjFQU1dBdittdExsd1dU?=
 =?utf-8?B?dFFTV2RlQUxMOGhUNW5zbE82N1N5djc2Q3k2RDJKdThWQXZ4TGowby9GV28x?=
 =?utf-8?B?NmtvUDc4QTBGQzRHdmRlM0JMb1VFT3k3eFNSYUdZa2xqdkdpRVViNURQVnhw?=
 =?utf-8?B?d3psZ2VKSTF0WnZTcXUwelhSNURxRmlEaWVDYlJnc3VqRzJhZHlXL2VuWG5U?=
 =?utf-8?B?MitWNFdNczFyUWdIcEZTWlY1U3pyK3lnbHNZQXF1VkhNSklPbS9hNngxVURq?=
 =?utf-8?B?SUlnaTNLcVZ3enVVd0FwSVBLd3hLWjlEMXdMenpyTDMzOXRvc1ZZRHA2ZHQz?=
 =?utf-8?B?WVdESGk3NGpoV2UyVkt3aExkVUhJNXJmbGpQR1RjZUJVOEw2U1Q2MC9nWFE3?=
 =?utf-8?B?cmgxdE5YT05WSGhJL1UyeUFHcCs5RU1IVEpNVWEwMVg2Z29qTDQyTldlQUpl?=
 =?utf-8?B?M0w3bjlEc0xQMjdwaWpLMUJMTm9ESE1YOGlwZEhnL3l5TVVrVnNoWWNadDhN?=
 =?utf-8?B?a2JVRGdFZGd0dzFTYmNtRHg4SVlhV2NLMmY2cVdrUUwzYjRYYlpsczZkK3Fa?=
 =?utf-8?B?R0pVYkNyMmFoVDhHZTZML3o0WWlhNHZTZHdMWmw0MVRiOVNPN2dwbndHZlBy?=
 =?utf-8?Q?+s1c=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d29d4e58-501e-4ad3-981e-08dd54891942
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 04:09:56.4967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mZj6BntK7wbUH6TVl7ThTugIckanbSNf2xnKC9CAgtZ5xF++QT+udzRm4zZr0b4tgLxDD8AFF1YzzTwaE9F1Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR18MB4129
X-Proofpoint-ORIG-GUID: h8cJW4UiuP3tP4Q2Ls6SIl9op7Amg1gf
X-Proofpoint-GUID: h8cJW4UiuP3tP4Q2Ls6SIl9op7Amg1gf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-24_01,2025-02-20_02,2024-11-22_01

DQoNCj4gRnJvbTogR3VlbnRlciBSb2VjayA8Z3JvZWNrN0BnbWFpbC5jb20+IE9uIEJlaGFsZiBP
ZiBHdWVudGVyIFJvZWNrDQo+IFNlbnQ6IEZyaWRheSwgRmVicnVhcnkgMjEsIDIwMjUgMTA6MzQg
QU0NCj4gVG86IEdlb3JnZSBDaGVyaWFuIDxnY2hlcmlhbkBtYXJ2ZWxsLmNvbT47IHdpbUBsaW51
eC13YXRjaGRvZy5vcmc7IGNvcmJldEBsd24ubmV0DQo+IENjOiBsaW51eC13YXRjaGRvZ0B2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCAxLzJdIGRyaXZlcnM6IHdhdGNoZG9n
OiBBZGQgc3VwcG9ydCBmb3IgcGFuaWMgbm90aWZpZXIgY2FsbGJhY2sNCg0KPiBPbiAyLzIwLzI1
IDE4OjM1LCBHZW9yZ2UgQ2hlcmlhbiB3cm90ZToNCj4+IFdhdGNoZG9nIGlzIG5vdCB0dXJuZWQg
b2ZmIGluIGtlcm5lbCBwYW5pYyBzaXR1YXRpb24uDQo+PiBJbiBjZXJ0YWluIHN5c3RlbXMgdGhp
cyBtaWdodCBwcmV2ZW50IHRoZSBzdWNjZXNzZnVsIGxvYWRpbmcNCj4+IG9mIGtkdW1wIGtlcm5l
bC4gVGhlIGtkdW1wIGtlcm5lbCBtaWdodCBoaXQgYSB3YXRjaGRvZyByZXNldA0KPj4gd2hpbGUg
aXQgaXMgYm9vdGluZy4NCj4+IA0KPj4gVG8gYXZvaWQgc3VjaCBzY2VuYXJpb3MgYWRkIGEgcGFu
aWMgbm90aWZpZXIgY2FsbCBiYWNrIGZ1bmN0aW9uDQo+PiB3aGljaCBjYW4gc3RvcCB0aGUgd2F0
Y2hkb2cuIFRoaXMgcHJvdmlzaW9uIGNhbiBiZSBlbmFibGVkIG9uIHBlcg0KPj4gZHJpdmVyIGJh
c2lzIGlmIHRoZSB1c2VyIHdpc2hlcyB0byBieSBzZXR0aW5nIHRoZSBmbGFnDQo+PiBXRE9HX1NU
T1BfT05fUEFOSUMgZnJvbSByZXNwZWN0aXZlIGRyaXZlcnMuDQo+PiANCj4NCj4gSSB0aGluayB0
aGlzIG1ha2VzIHNlbnNlIGluIHByaW5jaXBhbCwgYnV0IGl0IHNob3VsZCBub3QgYmUgZHJpdmVy
IHNwZWNpZmljLg0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuIFdpbGwgZG8gdGhlIGNoYW5nZXMg
YW5kIHBvc3QgYSB2Mi4NCj4NCj5HdWVudGVyDQoNCi1HZW9yZ2UNCg0K


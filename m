Return-Path: <linux-watchdog+bounces-4351-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A6BBC33B5
	for <lists+linux-watchdog@lfdr.de>; Wed, 08 Oct 2025 05:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0A90189FE43
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Oct 2025 03:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F398A2BD015;
	Wed,  8 Oct 2025 03:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="TOIguMxI"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023137.outbound.protection.outlook.com [40.107.44.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7781C29E0E9;
	Wed,  8 Oct 2025 03:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759894198; cv=fail; b=YI5Vv3pLy3AWla5TBO2MqP53s/g4LtgzbSTSfR5kvuLlTRbD11hcNwEZdum2IX59xRra+xDatmPkbVhaccGv7jh7g1boG59XovxlRi2ulK5qihnb/UopegWJw2gXSCuRDHqvvUDD6zH2YAwVcM5YTUZTkhEiV0t0PJfqfP0bOic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759894198; c=relaxed/simple;
	bh=2/SKf/+i8U4pUkJQpX2hZR12Zhda7JDR/gR5w/W85YM=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FdcnuzdghripKb2nbX2qBf4a+p6J/HC+2/vtUNxfefmz6vFkDEYUBrcqyZeHWjnETXPN91zd6yu6/t4vW2Th17bzC2lA2PKPl/q3keiEaffcpDql84JtdrkjeCLiTZD4J/GJQvpbvd3TTvmXczX6/dGWMrGtQOzV+wnDzvb4HFk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=TOIguMxI; arc=fail smtp.client-ip=40.107.44.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iu3vJRdD8N2lO2LkND+bK4cxKCeDG6toKIfxrBd+gXVJcMhgvkiOqB0O/nK5bscJ+XVGPJ+Cb8QSPIB+i3UEl5CkoyPLJiUhh+onAB2IyU/FllD8OJ8Y6t2Napz1SJDWh591PwbmIZJv5g+BBlJYlLqPBUHOCGPvftVH8HvlcoffpcxfTKTsd1nJZhZ8I+GT9EzF6NvckmsLyP6bXf0CTaAlpuVwKiw10StUusB3+73SqMjgHriyjIY4gc5sF5IMb5YREgnfhg51OPvWkPoS/0Jw7kefkVUlVNMs7R0wLaDBKrSpdBhWjF9EXzhxKUxDYc/3krFmlA5ZdoKBe9NVTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/SKf/+i8U4pUkJQpX2hZR12Zhda7JDR/gR5w/W85YM=;
 b=ZuXEppLz5PA54gXgk2zyN8jdFj7ng0/LoFOiD0ECbo4UIz3M6BXVEqEwMw7NsIaN4jOrxeJ7SPTZxYI2DKWDD9pYjPxPmAyDvEkVnPTsO7qpUMlovFhiG1a+jneg3l7oiEIJtM7abnIeYAJw6KO3+OWeFj47dEAylugsQM5iFu6+N5jLL2MH4/v8/yxeEhhg94Dlu/yypVuv7zSOgwiTgkTftOMqDMHXIvM+hahg13zjSK3emXemMXqg0W5p3ZMLeozyKoVARNXmoKr2KCB4tabH84X1qzdYF/ZB63XX/XHCmH97zRprkPKw136O00HQc+DD8iZG44ICiO27+D2X0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/SKf/+i8U4pUkJQpX2hZR12Zhda7JDR/gR5w/W85YM=;
 b=TOIguMxITD00jyB3WhmfbGKABXkZZvz76jZkwAOfQqaj2JFKpp790lplMptXUPG6AJaG0ttUpTA4RajtgBI4Py9t5rQfr0u0ehkoCZAV97Sxc0P53bpxc3/sOSc56TsFRnPavQjpcg2uD86c3GsRAVje7OOygRyzRZp6joUPSQJ+tisPazDcWJyn1t1re/AMSLTADKT5Osfo9IHTihLrxm4d6WZfqBWyyfRqgfVobhIBMW34TE1OEtiTx9pNnpyzrWIaH5z2j8lfg2/ByAFM8z8NaOb7WVsE/W6LunIqB95/yTSdWlpU+x7PRiUE3aNZbF8USupwoXusZRx7kSwFdA==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by SG2PR06MB5156.apcprd06.prod.outlook.com (2603:1096:4:1cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 8 Oct
 2025 03:29:51 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%5]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 03:29:51 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Guenter Roeck <linux@roeck-us.net>, "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: RE: [PATCH 2/3] watchdog: aspeed: Support variable number of reset
 mask registers
Thread-Topic: [PATCH 2/3] watchdog: aspeed: Support variable number of reset
 mask registers
Thread-Index: AQHcN2WLwgsCRZWRQEWyarlPu3IcQbS2xgWAgADNspA=
Date: Wed, 8 Oct 2025 03:29:51 +0000
Message-ID:
 <TYZPR06MB52035407C39249441F09AA18B2E1A@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20251007083650.2155317-1-chin-ting_kuo@aspeedtech.com>
 <20251007083650.2155317-3-chin-ting_kuo@aspeedtech.com>
 <83a90651-0b46-4c68-ab90-361422192e90@roeck-us.net>
In-Reply-To: <83a90651-0b46-4c68-ab90-361422192e90@roeck-us.net>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|SG2PR06MB5156:EE_
x-ms-office365-filtering-correlation-id: fb08cc21-6552-4a9e-7c3a-08de061af0c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|921020|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?eG5FN2lMOTFxdlVyeDNPeU5RM2lWYklBdkNZeUlDUGhNNkRrMlBmSkNla09p?=
 =?utf-8?B?QWEvN2tPdUxPNkN5eDVsRUsxamhSRkNXS1I3Y1lvVllSNVc5MDVtdjRySmpu?=
 =?utf-8?B?RUZzb2dadGd3NHhjdlVueUZuTWw2aXdTVEFZMWZtUVBqdjlXNktibXlPSnJ3?=
 =?utf-8?B?bGwzY3JucEhOS2diZENseExwaU9OQVI0MXlVeFRFQXN6VTlSSjExVEFxVDkr?=
 =?utf-8?B?WkYzcExnbGhCS0cweW5PV3R2N2lGZ2l4VTR1UE1mNmVDUHZVcW1JZitzS0Fa?=
 =?utf-8?B?UHNnYkg2VW1laC9JS2xPaEZKbkM1c3hIemd0L2x6TFJIUVBrcG5UY1RGUDFj?=
 =?utf-8?B?d0RlMDBsT2x4SVpxbzZFOVZaSkxWSmRCdC9zQjFUOE9kd21WMFUwTlh5ZEF5?=
 =?utf-8?B?VExyWHJoTEtjRmJQM1RMT2hDbEc4eCtVRXJZbHlmUTBOblhFUkZnMWx5Q01r?=
 =?utf-8?B?UFpJREs1ZFIrbit2alNUamhqQjFXQmF5K3owLzVkcTVqSnlMRitLTzFyT0FJ?=
 =?utf-8?B?MTBISzFmR24yNDNEUmFUbi9qb2d2dzhGQTlpTlhyc0xGWXV2WjhHbWc2UnVG?=
 =?utf-8?B?enpuUGhZdkNmK1BOZUhBdWtHVnBGNzVIcG5CMDBMRDdZZDBORmhqcnRGKzhu?=
 =?utf-8?B?VmVWK1ZUT2ZGRXo3dkExTjZBREw3QVYvb29uL3graFpJQkx6SklHbU1aS255?=
 =?utf-8?B?VHFxN1lBRVg4b2NtdjdCZUlNR2JxNEQ3TG1hUDdFejlIbHhsbW51NGVwYWdl?=
 =?utf-8?B?MTVCd2d0cHB4SkhqYzJIY0ExVHVYNkEzQnJFMDRzd2NYeHp1T1VHaWNFOUhs?=
 =?utf-8?B?c3F3Yyt1d2hlOVpPRlJRSEphekxsaXFCL0xlbnk3M1cvNmozQkZyUVdTVzdw?=
 =?utf-8?B?c25xNzBDUnM2SVpHb0xHNEFGaWkxY1RCUzVvaEVaTGRmbks5UHBpTFFXbm1X?=
 =?utf-8?B?ckFDZTNIYm9PTzlMMU1YOUZMUDFqMUx0c2hweWtHRktRZFlBNkx3bjJUaTJU?=
 =?utf-8?B?VEVUY0xxNjlhQ1hobElwMmhFVHRDK2JnTUMwY1l0SzhSdWVvSjNqMzhYTEl0?=
 =?utf-8?B?R3N5dSs3Yis2dVg5S2ptYjJBd0lPN3ArNGpScGJKNnB4QXc4WmpKbU8wWUcw?=
 =?utf-8?B?ZzQ4UE9GTGhYc3B2M0hzdmZjRXJyaEpEejF3S3B3cGNxd3F6N3ZpUFc1NCtN?=
 =?utf-8?B?dDVxdEtyZlVjOWovb3RYQVhxOWhhVk5YUEtQQnAzM2o3Y3FmR0EzdmZrNDZv?=
 =?utf-8?B?Y2FqRHBWQmZBL2pPWHNwdFRBS2xlZENibHlRWnUxbXIxY1lRbWd1Uk5SbjM3?=
 =?utf-8?B?bGVSbXFTdHdsazdNYVFLNjRIY1pwQW15cHVLRE5wTlIwbWRacm1MU2w5NVVx?=
 =?utf-8?B?UHJwQ2VITlNrZi9RTUVFRDJxemlNNW1Raks4M21Vd0xXZUkrWkIrcVFSbHNH?=
 =?utf-8?B?ZEZqNWI0R1FmNzhpZlUrdFRWcFl6OEdlcTVTQXB5MEFCTzhqWW4wNzZMYjVk?=
 =?utf-8?B?QTkwTUNjY0lvUnl4YnlFcEtMOXcvU1Jva0dBRzBSZjhyNVRDMlRaZ2dSdDZD?=
 =?utf-8?B?NTZ6TTFDOWdzS2ZUc3FEZVdLT2JqMzNKT3kxL2tuWUFMZHh1QjlBOVkva1pt?=
 =?utf-8?B?QXhtMnFkdk9pZ1V5YTRsSGNwbTBEY1ZLaDZXOGhNUHFOem8rc2hYUGU4cHhJ?=
 =?utf-8?B?RjUwaUoxNERkcEFpVzlGVlY1VHZHa1BvcWtScGsrL1BIdkhyMWJtMHdMQk9W?=
 =?utf-8?B?Q0pEQ1FKVVAyME9NMms2U1RxYUFiVkVnREJpY0Z0MlZ4Y1V3dHo1RU1ZV1Fi?=
 =?utf-8?B?dXl1cXpaOEc2Y2tYYisxQmxhdWdhemZlTm9UekhaV1pESUxpdFJRM1lUZXdT?=
 =?utf-8?B?UXJjb3BaU3NFanIycFZZdkNwZXFua2E4cnhZNHVyQlRiMDVBUkUxSjA5TUZV?=
 =?utf-8?B?bXZQeVNIcXdLdDVId3ZBdThNZFVrMzJsSnBUdUxWSDZoQlJ5bXJGT1J5ZE1I?=
 =?utf-8?B?QjJPNTBKU1B6eEM2bTJoM205bzYxNW01NXlBamttWUwwOUFqYVEyVjRmT0NH?=
 =?utf-8?B?SERtTGJFRXdUOU5HL3Jvamk5MzE0SGN4ZWJSQT09?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(921020)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ujc0RGcyNnpCWVhGNDd3amF3ZEYzOXpQSTdNR3lnN0NudmxPdUNWeFZ6cDlV?=
 =?utf-8?B?aDJRbEJLcHovTWpKQWl5ZENuNEtIT2xXaHVGMWJjaTQ0d0VjdXcvekxBbnJa?=
 =?utf-8?B?MVpjRU8zU1U1ZFdqa2RSYW5wYTNuNHdGdm41ajR0TkdYRVJyTm1YY21sN1V3?=
 =?utf-8?B?a3JNc3ptTjVFT2hHTk1UOFFkdTFxQ0VhRFhQNHVFV1VaRTRielFqSlQwNUEw?=
 =?utf-8?B?WFZqVTRVcFdXTVczQlpJeGU3SFFKZlcySk9oUDVtaW43RkdyekFsNHM5Yjht?=
 =?utf-8?B?L1FvZTNDeGhMZm5rSmE1WXl2dk0rc1JQd0NjTXExRmpOMmhZUW9NSlYxY3Rv?=
 =?utf-8?B?ejVTTXZzVjhobC8rQ3lyMmtxSGFFbnBHVXozQmgxNDhXTitHRis5enA4QXh0?=
 =?utf-8?B?cXE2SlhCWTJhT1BqaFFWVXhweE12V3VTRzFXeFgrT2pmZlFib1lwbUs4elJZ?=
 =?utf-8?B?aURHL05HYnpSb09Xa0RHamVQN011Sm1rWXJpcEY2aTV4ME5mMDBvUlpUK1Vq?=
 =?utf-8?B?czQrb1YyTndDbDBZOVhwaC9uK0NCblhvcnZtV2hNZjZodW96dTZtc2UrVDJo?=
 =?utf-8?B?NytYY1VEYW5ONkxSNnQ4MHpxVlVjZlFGYkpyNUlHSEp1aW9lSkZwN3lRTU5M?=
 =?utf-8?B?VzF2OUVUK2Y4MmFSaHVLZTQ1OTNIa0NzajJ0cjRaOURzV3pIWHFkZDZQaWJl?=
 =?utf-8?B?ZEt4SXFnbmo3NElHUDlIWWM3bkNDVkhKanRsWXN3MUI4TnZHTlhYZ3g1TGRX?=
 =?utf-8?B?U0pLT0J4UDU2VHNRVWg5MFpFY1NtWCtNYldtTEdBcXFIdGp4RURIdzg5YTZM?=
 =?utf-8?B?QlpyUGR5TWM3L0NsQlF6QWt3aU5KYktCaExJREhKanViQi9Nek5KRFFWaUpE?=
 =?utf-8?B?Tys5MDJoT3RBR2tKR1gxOVFSZFpMMGN6eXlzcUlhQ3JJZzk0R3g2RnZhMTJI?=
 =?utf-8?B?d0MvZG9CdGlVUjdGY2JSYi9nSlZpWUVMeHNFRUh1V0tTb3VNbGw1TzRPeTZF?=
 =?utf-8?B?SHpBanhJNEwwRWMxN1pyQ3lXQ1pZVURXK1ZUWlZVU0lOaXFtcGZIYisyZUhF?=
 =?utf-8?B?QjBkQzF0SXVaMUJCaVo3aUk2MklTeE9aZnplOWZkV3dRa3hYazFOYjVibDIz?=
 =?utf-8?B?WG1QZm1yZjBhQlptU3haWlo5UkJia2grZlpQTVFDTGRIL1ZtNVFTTTlTS3hT?=
 =?utf-8?B?aWVTV1RRS0VuajFYc0xUbmgxWmx3TVVLbjRML3pIMmtuNVZRbFZZNU9jZmZ0?=
 =?utf-8?B?QTlPcVRkZm1TTEJ0T2g2ZW55UTU3T1ZONlgzOHhLSXZNZERmSUZXOVZFL3JD?=
 =?utf-8?B?MUg2N0h6TUJEY3VON0c0S3JiMkFWTmVJZm9aWXNlQ1ljejcxdGNkUVM1ODdt?=
 =?utf-8?B?Yko1Y0Rmd20zNVhzZmVYbHF4elZvY1NYWVZEekU0ZEovb2ZEQXJQeHNkNkxF?=
 =?utf-8?B?QlNZQm8xQ2UyL21BaWlma2NyTG1jM25kUkRRR3V2WmtJeUVHbXpFYlhyVytN?=
 =?utf-8?B?NlpPODM0RUFmbEN3cnA4czhpUkxNcXd4bjBrdFMyaDlKd2s0bVc2UU5kaGRn?=
 =?utf-8?B?MWNnT0VscXpXbjZjb0xyWTFrR3dRVldjckhvTmdWK0lyNWFieE5MeGRMdnp2?=
 =?utf-8?B?MFhRNk4wQW5yd3poTGtuOTRHUXhGL1dCNUpud3dqdDU4SnNySWJqZUhPT0xw?=
 =?utf-8?B?TDJaZkM4TEc5U0JNaE94Y1hnUzhyTWRMSXpIckRmeTdldE5MR2VMV2hGeGty?=
 =?utf-8?B?c04vV1FydkN0bHlFd2p4andFamM0WFl6VUZPMHIwNFIzRzdWVkFJc2VuYnNp?=
 =?utf-8?B?SmxOUTJUSXo2aXA5bDUvUSt0amQvK0hFTnZsQkVVMEVLVVUweTVCaEQyZjFu?=
 =?utf-8?B?aGdvUGR3cTVyWWU5NnM2SHJ5T21vbU9oVFBTT0dqQUp4Ly84QS9UMTNna2hz?=
 =?utf-8?B?Mnlndk5FZFdha2NuWVlnZ1k0ZWRCVmo3WFQ3SXdYZklwMlNsanVuRTVaeDY4?=
 =?utf-8?B?Z24yamJrc0hsVmdkeWVCU3VEVElDNGFQaEpNOUtYTGk1YzExc2FEMDRTS3l2?=
 =?utf-8?B?bDRCTTF1aUd5dkJkM0JnTW8xaEtkWWU4S3pRZTY5anExTElZY2U5d1doMkhm?=
 =?utf-8?B?WG9ySjViNWhvOWJmN0tIcjV1SCtwaHlJbUkycUF6WVc1b2w4cEtUVUthbHQz?=
 =?utf-8?B?dEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5203.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb08cc21-6552-4a9e-7c3a-08de061af0c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2025 03:29:51.0427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5CrPi0wSBp2Dm0yAr+ytByFJ4m0m6XAcwDzJ+I3HfQ93b22N1SEBwYdJGw1Gi8mCkTJevpCdiFWi/d7Juc3OfNSTYKKx7DG/xWFuWrMrcnI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5156

SGkgR3VlbnRlciwNCg0KVGhhbmtzIGZvciB0aGUgcXVpY2sgcmV2aWV3Lg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEd1ZW50ZXIgUm9lY2sgPGdyb2VjazdAZ21haWwu
Y29tPiBPbiBCZWhhbGYgT2YgR3VlbnRlciBSb2Vjaw0KPiBTZW50OiBUdWVzZGF5LCBPY3RvYmVy
IDcsIDIwMjUgMTA6NTUgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzNdIHdhdGNoZG9nOiBh
c3BlZWQ6IFN1cHBvcnQgdmFyaWFibGUgbnVtYmVyIG9mIHJlc2V0DQo+IG1hc2sgcmVnaXN0ZXJz
DQo+IA0KPiBPbiAxMC83LzI1IDAxOjM2LCBDaGluLVRpbmcgS3VvIHdyb3RlOg0KPiA+IFN0YXJ0
aW5nIGZyb20gdGhlIEFTVDI2MDAgcGxhdGZvcm0sIHRoZSBTb0MgZGVzaWduIGhhcyBiZWNvbWUg
bW9yZQ0KPiA+IGNvbXBsZXgsIHdpdGggYW4gaW5jcmVhc2VkIG51bWJlciBvZiByZXNldCBtYXNr
IHJlZ2lzdGVycy4NCj4gPiBUbyBzdXBwb3J0IHRoaXMsIGludHJvZHVjZSBhIG5ldyBmaWVsZCAn
bnVtX3Jlc2V0X21hc2tzJyBpbiB0aGUNCj4gPiAnYXNwZWVkX3dkdF9jb25maWcnIHN0cnVjdHVy
ZSB0byBzcGVjaWZ5IHRoZSBudW1iZXIgb2YgcmVzZXQgbWFzaw0KPiA+IHJlZ2lzdGVycyBwZXIg
cGxhdGZvcm0uIFRoaXMgY2hhbmdlIHJlbW92ZXMgdGhlIG5lZWQgZm9yIGhhcmRjb2RlZA0KPiA+
IHBsYXRmb3JtLXNwZWNpZmljIGxvZ2ljIGFuZCBpbXByb3ZlcyBzY2FsYWJpbGl0eSBmb3IgZnV0
dXJlIFNvQ3MuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaGluLVRpbmcgS3VvIDxjaGluLXRp
bmdfa3VvQGFzcGVlZHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVycy93YXRjaGRvZy9h
c3BlZWRfd2R0LmMgfCAxMiArKysrKysrKy0tLS0NCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy93YXRjaGRvZy9hc3BlZWRfd2R0LmMNCj4gPiBiL2RyaXZlcnMvd2F0Y2hkb2cvYXNwZWVkX3dk
dC5jIGluZGV4IDgzN2UxNTcwMWMwZS4uZTE1ZjcwYzVlNDE2DQo+ID4gMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy93YXRjaGRvZy9hc3BlZWRfd2R0LmMNCj4gPiArKysgYi9kcml2ZXJzL3dhdGNo
ZG9nL2FzcGVlZF93ZHQuYw0KPiA+IEBAIC0zNSw2ICszNSw3IEBAIHN0cnVjdCBhc3BlZWRfd2R0
X2NvbmZpZyB7DQo+ID4gICAJdTMyIGlycV9zaGlmdDsNCj4gPiAgIAl1MzIgaXJxX21hc2s7DQo+
ID4gICAJc3RydWN0IGFzcGVlZF93ZHRfc2N1IHNjdTsNCj4gPiArCXUzMiBudW1fcmVzZXRfbWFz
a3M7DQo+ID4gICB9Ow0KPiA+DQo+ID4gICBzdHJ1Y3QgYXNwZWVkX3dkdCB7DQo+ID4gQEAgLTU0
LDYgKzU1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhc3BlZWRfd2R0X2NvbmZpZyBhc3QyNDAw
X2NvbmZpZyA9DQo+IHsNCj4gPiAgIAkJLndkdF9yZXNldF9tYXNrID0gMHgxLA0KPiA+ICAgCQku
d2R0X3Jlc2V0X21hc2tfc2hpZnQgPSAxLA0KPiA+ICAgCX0sDQo+ID4gKwkubnVtX3Jlc2V0X21h
c2tzID0gMSwNCj4gDQo+IExvb2tpbmcgYXQgdGhpcyBhZ2FpbjogV2h5IHNldCBpdCBvbiBhc3Qy
NDAwID8NCj4gDQoNClRoaXMgc2hvdWxkIGJlIHJlbW92ZWQgZm9yIEFTVDI0MDAgcGxhdGZvcm0u
IEkgd2lsbCB1cGRhdGUgaXQgaW4gdGhlIG5leHQgcGF0Y2ggdmVyc2lvbi4NCg0KPiA+ICAgfTsN
Cj4gPg0KPiA+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBhc3BlZWRfd2R0X2NvbmZpZyBhc3QyNTAw
X2NvbmZpZyA9IHsgQEAgLTY2LDYNCj4gPiArNjgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFz
cGVlZF93ZHRfY29uZmlnIGFzdDI1MDBfY29uZmlnID0gew0KPiA+ICAgCQkud2R0X3Jlc2V0X21h
c2sgPSAweDEsDQo+ID4gICAJCS53ZHRfcmVzZXRfbWFza19zaGlmdCA9IDIsDQo+ID4gICAJfSwN
Cj4gPiArCS5udW1fcmVzZXRfbWFza3MgPSAxLA0KPiA+ICAgfTsNCj4gPg0KPiA+ICAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBhc3BlZWRfd2R0X2NvbmZpZyBhc3QyNjAwX2NvbmZpZyA9IHsgQEAgLTc4
LDYNCj4gPiArODEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFzcGVlZF93ZHRfY29uZmlnIGFz
dDI2MDBfY29uZmlnID0gew0KPiA+ICAgCQkud2R0X3Jlc2V0X21hc2sgPSAweGYsDQo+ID4gICAJ
CS53ZHRfcmVzZXRfbWFza19zaGlmdCA9IDE2LA0KPiA+ICAgCX0sDQo+ID4gKwkubnVtX3Jlc2V0
X21hc2tzID0gMiwNCj4gPiAgIH07DQo+ID4NCj4gPiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIGFzcGVlZF93ZHRfb2ZfdGFibGVbXSA9IHsgQEAgLTQ4Miw4DQo+ID4gKzQ4Niw5
IEBAIHN0YXRpYyBpbnQgYXNwZWVkX3dkdF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2KQ0KPiA+ICAgCWlmICgob2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsICJhc3BlZWQsYXN0
MjUwMC13ZHQiKSkgfHwNCj4gPiAgIAkJKG9mX2RldmljZV9pc19jb21wYXRpYmxlKG5wLCAiYXNw
ZWVkLGFzdDI2MDAtd2R0IikpKSB7DQo+IA0KPiAuLi4gYmVjYXVzZSB0aGUgY29kZSBoZXJlIG9u
bHkgZXZhbHVhdGVzIGl0IGlmIHRoaXMgaXMgYW4gYXN0MjUwMCBvciBhc3QyNjAwLg0KPiANCj4g
SWYgbnVtX3Jlc2V0X21hc2tzIHdvdWxkIGJlIHNldCB0byAwIGZvciBhc3QyNDAwLCB0aGUgdmFs
dWUgY291bGQgYmUgdXNlZA0KPiBoZXJlLg0KPiANCj4gCWlmICh3ZHQtPmNmZy0+bnVtX3Jlc2V0
X21hc2tzKSB7DQo+IAkJLi4uDQo+IAl9DQo+IA0KPiBhbmQgaXQgd291bGQgbm90IGJlIG5lY2Vz
c2FyeSB0byBhZGQgb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUoKSBmb3IgbmV3IGNoaXBzLg0KPiAN
Cg0KVGhpcyAiaWYiIGNvbmRpdGlvbmFsIHN0YXRlbWVudCBpbmNsdWRlcyBub3Qgb25seSByZXNl
dCBtYXNrIGNvbmZpZ3VyYXRpb24gYnV0IGFsc28gcHVsc2UgcG9sYXJpdHkgYW5kIGRyaXZpbmcg
dHlwZSBvZiByZXNldCBvdXRwdXQgc2lnbmFsLg0KSG93IGFib3V0IGNoYW5naW5nIHRoaXMgImlm
IiBzdGF0ZW1lbnQgdG8gdGhlIGJlbG93IG9uZT8NCglpZiAoIW9mX2RldmljZV9pc19jb21wYXRp
YmxlKG5wLCAiYXNwZWVkLGFzdDI0MDAtd2R0IikpIHsNCgkJLi4uDQoJfQ0KSXQgd2lsbCBhbHNv
IG5vdCBuZWVkIHRvIGFkZCBvZl9kZXZpY2VfaXNfY29tcGF0aWJsZSgpIGZvciBuZXcgY2hpcHMu
DQoNCj4gR3VlbnRlcg0KPiANCj4gPiAgIAkJdTMyIHJlc2V0X21hc2tbMl07DQo+ID4gLQkJc2l6
ZV90IG5yc3RtYXNrID0gb2ZfZGV2aWNlX2lzX2NvbXBhdGlibGUobnAsDQo+ICJhc3BlZWQsYXN0
MjYwMC13ZHQiKSA/IDIgOiAxOw0KPiA+ICsJCXNpemVfdCBucnN0bWFzayA9IHdkdC0+Y2ZnLT5u
dW1fcmVzZXRfbWFza3M7DQo+ID4gICAJCXUzMiByZWcgPSByZWFkbCh3ZHQtPmJhc2UgKyBXRFRf
UkVTRVRfV0lEVEgpOw0KPiA+ICsJCWludCBpOw0KPiA+DQo+ID4gICAJCXJlZyAmPSB3ZHQtPmNm
Zy0+ZXh0X3B1bHNlX3dpZHRoX21hc2s7DQo+ID4gICAJCWlmIChvZl9wcm9wZXJ0eV9yZWFkX2Jv
b2wobnAsICJhc3BlZWQsZXh0LWFjdGl2ZS1oaWdoIikpIEBADQo+IC01MDMsOQ0KPiA+ICs1MDgs
OCBAQCBzdGF0aWMgaW50IGFzcGVlZF93ZHRfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCj4gPg0KPiA+ICAgCQlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMl9hcnJheShucCwg
ImFzcGVlZCxyZXNldC1tYXNrIiwNCj4gcmVzZXRfbWFzaywgbnJzdG1hc2spOw0KPiA+ICAgCQlp
ZiAoIXJldCkgew0KPiA+IC0JCQl3cml0ZWwocmVzZXRfbWFza1swXSwgd2R0LT5iYXNlICsgV0RU
X1JFU0VUX01BU0sxKTsNCj4gPiAtCQkJaWYgKG5yc3RtYXNrID4gMSkNCj4gPiAtCQkJCXdyaXRl
bChyZXNldF9tYXNrWzFdLCB3ZHQtPmJhc2UgKyBXRFRfUkVTRVRfTUFTSzIpOw0KPiA+ICsJCQlm
b3IgKGkgPSAwOyBpIDwgbnJzdG1hc2s7IGkrKykNCj4gPiArCQkJCXdyaXRlbChyZXNldF9tYXNr
W2ldLCB3ZHQtPmJhc2UgKyBXRFRfUkVTRVRfTUFTSzEgKyBpDQo+ICogNCk7DQo+ID4gICAJCX0N
Cj4gPiAgIAl9DQo+ID4NCg0KQ2hpbi1UaW5nDQo=


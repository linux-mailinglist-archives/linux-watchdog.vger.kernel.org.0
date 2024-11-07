Return-Path: <linux-watchdog+bounces-2426-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 096AD9BFDAB
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Nov 2024 06:36:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C933B21F2A
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Nov 2024 05:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EBC91373;
	Thu,  7 Nov 2024 05:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="aXaTUiBh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023103.outbound.protection.outlook.com [40.107.44.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361B310F9;
	Thu,  7 Nov 2024 05:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730957759; cv=fail; b=bJABDaVBPt30feKtwCDHSusG7SCKA0GDeIhW6uQwNs1ytY945wtHytfBmujb+MGXUrPX6P7BlOvmJwQgmPqkQ3k4rL5QRK6PjKv5Hi7p0RuENrDYRIDrYmaFw4qhpd04BaRDCx1vtqFjwz2ZEy2Me3HJ3L00anO5hqR/JgiIj+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730957759; c=relaxed/simple;
	bh=2f360txkijXb+Y2i6EymjtOrR/aKXvANLRJfdJ2b8A4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f+0E9G64bzMQ4rOvXZU8vZMHqD2KgVoN/aC4yn7DwnmVVcSVM6vjt3IacVvrsL5sHhF9rV6F7U/PLrN0HYP50TLNxnOSrtqZU4+6dvMfj8m0Hx6AadAH0GIP5Uf33yySf+ODAJSu7DOYGLDKUuzl/+tBkI1+Uuuco75QF/jrDoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=aXaTUiBh; arc=fail smtp.client-ip=40.107.44.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4rz72tsvHHCig3SrvuF5OEu/yNjyfUGsHkjR+s0p4+nPgHkw8VqdiwZSAwVjEanulCMG4TRipreCqezcDjXQuloM2hjqYKYHUKc5LAw1A2MvEFSgbHq7vqCO5oLxX9b3+IUJNNe0sHrqPkmwn+rZ99KlQ7000zGz0JhJsdkhmQ2kyTkjrFVYgZ8GgrirjbmpT0fVQAWRPAmvWldiNClbI7DD4hMpgeane+R/3FfF6LyxmazwfZ0IUHXg/F26ULdOaJZ6N3jcA+p81lv866D4nhhUdRsb4h3p2HVzM+nkfCpFGi/x+DKMF0L8UbE4K7xaHlTImWT4FmfG+gsuqZB7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f360txkijXb+Y2i6EymjtOrR/aKXvANLRJfdJ2b8A4=;
 b=JHaCdPMzBqm12LIfrlTrAh/LnfdSWc9Jcqr/xq5kh0ZGy1xRE+SNB2/MjBSVz/gp/5N4adgX+YNEnHVxlWlACXnyzxSOJew11YGToFENjiK9NTGLKLK+a2fGW5c1Op5MrbEJsdrVrYvdXHAHnryy+gPrzW0ppq/QT5aE7LT6aiK3wTQPGcg5KdiW+jZISfqsfzsZxtrpCShEFA4oK0J1hIDVsxdRc4byru7TpeOHME/mnYlhPcHZiFUQ3msLqaXVPa/BIwu9YATGHO9NvMpevwrBa7eJ8QS+eJEIO6sJO8rGRvchBReWeQ9WodLhSarzxdGEAgleYLlCgQsWMuFH5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2f360txkijXb+Y2i6EymjtOrR/aKXvANLRJfdJ2b8A4=;
 b=aXaTUiBhDDFPQGyMu3HFdTN9oXfC5/1I2BWYXnZcWO5p/NjkEARPIsNbVJ/cIemqH29tbvZ7zVTmHNNZxFytDJ/SDpYP4/OQpwZByld6iuxxoB/szvLrZCYhEBBnXrGDbhzZuh4oZpyEjHq7/slylKRHM/jUqFvDk5yT7xTjUOkIL6q5DXyzWQXIMmtdlWPxbc3W58q7OWO4l2rWODwpIyphTcTDgG36mMGa5Wc8qUyfw8QzcXRHEeIFWRpE6oix7CQ1/0sBcf/U7p835qorFoyYGWGaIXvfiMDYlsXhiivsdsQ8mHSuSTekjCjK0gVjEK3I/qHiopBix5OIUbnfLQ==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by JH0PR06MB6319.apcprd06.prod.outlook.com (2603:1096:990:b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Thu, 7 Nov
 2024 05:35:07 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%3]) with mapi id 15.20.8137.014; Thu, 7 Nov 2024
 05:35:07 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Guenter Roeck <linux@roeck-us.net>, "patrick@stwcx.xyz"
	<patrick@stwcx.xyz>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"wim@linux-watchdog.org" <wim@linux-watchdog.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>
CC: "Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>,
	"Patrick_NC_Lin@wiwynn.com" <Patrick_NC_Lin@wiwynn.com>,
	"Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>, "DELPHINE_CHIU@wiwynn.com"
	<DELPHINE_CHIU@wiwynn.com>, BMC-SW <BMC-SW@aspeedtech.com>,
	"chnguyen@amperecomputing.com" <chnguyen@amperecomputing.com>
Subject: RE: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
Thread-Topic: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
Thread-Index: AQHbLFdFSiy5MyUwCUe0YBcXjsWUGrKi/sOAgAhU7fA=
Date: Thu, 7 Nov 2024 05:35:07 +0000
Message-ID:
 <TYZPR06MB5203428AEABDF5EB2BFAA9DAB25C2@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
 <787d7a81-0f53-4dbb-b8d6-f7b00e9cf837@roeck-us.net>
In-Reply-To: <787d7a81-0f53-4dbb-b8d6-f7b00e9cf837@roeck-us.net>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|JH0PR06MB6319:EE_
x-ms-office365-filtering-correlation-id: d5a145f6-a45d-4f42-70a0-08dcfeedf078
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Y3NWNWFLV3cxWEszYmIxMVJ1Tmdla1pTa1dTMFplUVVwVWN0RXhxQUFmb0lr?=
 =?utf-8?B?K3NhNStNdGdBRFVSVVNEb2hMZjNjR21zVkVwU3VYTDlXR1FQQ2FaWU10TVg4?=
 =?utf-8?B?cVBsZzdLNVQvdzVsNS8wczZPMSt6a0pJLzVkUVBwTDF0ZUNrcEpxMlpGUURz?=
 =?utf-8?B?TFVNYmNhVVVoeDhlOXV0ZUp3UlJUakIwSTZnSkRtWE8yY1RZMW1nNmVVNEl6?=
 =?utf-8?B?QUc2eXZ1bmJ3NXZMTHpLZGdtQ1QwMkN6NU1mcWZpYW1GL1ltVVhwUjBzOUZF?=
 =?utf-8?B?RHJlQmFoZ3QzSkZnOXhjRkcyOWs1WGt1QzB3R2ZTd3JqNUw0Z3VyaEtGNjJ2?=
 =?utf-8?B?VStyTDhFcWpBbFlKZmR4bERra0pQcTdzVnF5eXRtVzJMYlBkb1pjS3p0clll?=
 =?utf-8?B?N0tyMnU1Zkxlc2VZdXVnWjlKdGlrL1dkL3dWbVJDUGR6NC9BM2N1d3RCYWFn?=
 =?utf-8?B?MHJxMU82QXZHTG1Nc3BtczJPVWh0UTc0NDlEbFcyVC9yN3dMREcrNGVaVXFQ?=
 =?utf-8?B?NTVZRHhsdDZWZlllS09VV1o3NmJmRURmOHY4MUJWUi9leHhSTjdEcDgrT0Nq?=
 =?utf-8?B?ZUFtR0JERDZObnZGcDdGRS90NW5VNmxVYnVUc0lwTTV2bDczL0Mzd2xKU2to?=
 =?utf-8?B?dW8vU0JsTm56WTJOMHFYN2l0OUhqS0VNWFcrRVFNbDVtbU9qUk1nZmJUMCtJ?=
 =?utf-8?B?WnJzOThYc3BGdnBNYXF2NHltQm1YVW1GdUV6ejNzQ1FHeWdGaUpVR1ZDV0gv?=
 =?utf-8?B?OGwzZnlsNnpTWUdqNnU2Ui9Dd1NRRnFwMjk5ck45bEZLSjB1cmJYWTlrZDdz?=
 =?utf-8?B?dHQrQXl3TG5GL3g3UzRQbjhpMy9GeEh2ZXJJS25kUXFEYXJ3My9YSkdvTUVW?=
 =?utf-8?B?ZHdoNFVVcXRJT2FFbk85UjlWYmhseGlRbE1wTXZaUW9VQ1UybXBLN25jMDFM?=
 =?utf-8?B?RTZESzhBaElUc3ZTSXVQL3lkK3dTYUtITHMwYkhGVkJXWmtNTkkzbTJiTlFM?=
 =?utf-8?B?T1dDM1ZZR0Q2QUJPR2crY2FMb2tnSjhvT0N3UUMvN2dndC9ib212T0VEZTJl?=
 =?utf-8?B?SWc2ZnZXVlA4bGJ5UXRvVEFsN2Q4Q0NQaFAzZkhLQVBBbXVKM0tpQmRIVml2?=
 =?utf-8?B?aDFpaWNSVTdQb2NVZ0hRdG85NWlNdlk1Snc3QjhCbHVVWURKSTFaVzNNRnRL?=
 =?utf-8?B?cmV6VEVXbHVUb1RCYU5DRWJEUGZWem81a0xsNkJySVhmcWh0ZStQUmVWYk0v?=
 =?utf-8?B?MllpV0dKR3Y1UTJKWGYvYTAxbUdGTm1TaHM1R1ZLTlRhazJGV3NkZ3F1ekxQ?=
 =?utf-8?B?Q0JvS1liY3lHeTV0dzQ0UVdFeEFQdW1WTUlONzU2T0tESVcvZGVEN1BaZy9u?=
 =?utf-8?B?TDBCMXl6SVA5Y0l5YlRjRzUrUjBWWGlMbG81M3dhTlo1b2Z1bTRuZWZCd3gy?=
 =?utf-8?B?cHRTMWhISWlwN3JaRE5OUFpaeFJEYUxSYXdDYTdxU05DL01wZXJpUWNLWitY?=
 =?utf-8?B?ZThMeTlTYWljSkREVHVkaGtvTlNpUmhMaGxtMjh3M0FPUUh4WE9HWE5oSm5S?=
 =?utf-8?B?cEtyaEVvSTR4MEkveEZvYVVRRGRna1pvSG8zT0hRUmtvYTk2a2dmS2dFdHdT?=
 =?utf-8?B?Q2szRnBSTHFUUHBmTG9PdU9TdVUyaHB0ZEtyRHlYWGVobHJ2cUFmeG5oM1Zt?=
 =?utf-8?B?eHVlcENrRFhDMFJjVm01bExLbHRiM2didzNvYStoQXpOcXdNSTJ4VGUxZTJN?=
 =?utf-8?Q?nCFCHxDR4GQmR05psW23oUZBx2mFsn4py66H8sd?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YWZhNUhlM1hpVTB2YTNkaGtJTC94T2ZPaFBjRUs4bGxENTVLdmZCWGRaZE1F?=
 =?utf-8?B?cS9BVHJiM1pLSi90T1htVGx6c0ZqS0NVNnBhblBhdjBlVTRwZWJRMmZzSklS?=
 =?utf-8?B?YmNIL0lLV2QwQVJTczJ0a0R6QWNDam9SeWREOUZmN29GazlkUWtNaUNLZ3h2?=
 =?utf-8?B?N0ZVQjl5bE81cEVXNU14OEN0dEczQzNXUHFZTGVheFgrM3pCMnhrK0d2UFpU?=
 =?utf-8?B?T1NwajRwaXpidFB0b1BVNVBRWUt0VFp4Sm5Sb2ZXekJmMVljVkJMSUtlT2Jl?=
 =?utf-8?B?SDNwRjh3cTNvSG8wT3Y1aEp4ZjlkeGg4OTF3TG1laDdKSlRTT2k1WXlINzNV?=
 =?utf-8?B?SFVDajA3dzdjQlBWZ2Y5VkRjL2pSdjRnZTBDbloveEx6R3haN1BoanNsQ2xD?=
 =?utf-8?B?S3NDd3A2ZXdBQTlYSzJwaEozOWVvTkVjbG1VdVZ1QkhyYjdFQW55eUYzbHpS?=
 =?utf-8?B?MkxTVEFnWVdhMDdDWSttOTUrNnVaMEVUbE44bFFjYjJQY0ozRkJwQncrWndo?=
 =?utf-8?B?cW5BKzFUS1c5NnVUTFVQVENSdHJrNmF1amF1TENDdzRpSlRzWldJR3dweHRs?=
 =?utf-8?B?TkRheTJyYU5EMFc4OURmd0didnhpVVZyVk14d1YrV0pKcllGdHUvUmVnYnJk?=
 =?utf-8?B?RUJ5d25ra0xkUUNoSERpTFBLd3hRR2YzWlhLdnE5aEYrVmVSZzg5T1d2bi9T?=
 =?utf-8?B?MWdiMitXODRja3dLVzN6NmdJVUoxRzRsT200YlVHK0VRb25NMi9UQVIzWWdT?=
 =?utf-8?B?UnZBdDZmcDUvSzBSTWRPeFZWTU9YenQrMWx5bGxpTThmNGFiL29WekdiNTJz?=
 =?utf-8?B?ckNIVlcxalA4RHo1OHZtbGlwbzVzR1R5YWlReDYyS0lpRmdNRkRWd1R3NUF4?=
 =?utf-8?B?L3hqQ2FzS2FXNUlMYzh2R3ZZcDFCWGFiMUllS0dHblFKWC9laytWS0tLMkpa?=
 =?utf-8?B?YlJSRnZqSkVreS9DNmlnOHZtRlBKcU52U1dtMnpmUnltY0hsbkVFbEp0a0I4?=
 =?utf-8?B?ZUZVUjM0YjkrSGVpdDNMbVcycHRkVkdMTEcxd3dvV0xKZTFLSFVKbFgwa2FV?=
 =?utf-8?B?U2dXYW5Sc25GNXJkTEhoZCtORlBQeXluOG1MQ1FzR1NBK1hIdmNkNDVyeFRO?=
 =?utf-8?B?ajkrM0hlNEZEZ0QrdjBMeUdsb3liYXhOUzEvQitLTTJDdlpFSkoySGtZemlp?=
 =?utf-8?B?dmtBbXl6UHlHRkMydkNYa1psTVQya0JkRzFaWTdRSEhLVWtSdnRJTzg4MHRG?=
 =?utf-8?B?NUc3bHBIMGxkU2FmUC9SOGVHbEF6SXJRK0sxd1FQTkxCKzZlV2I4NWpmZG1Q?=
 =?utf-8?B?R0RJa0xGcEYxaUtZbjMxMHBIYklIVU1zTUUvbjVKY1pEMk53S1VFMC8xOHB0?=
 =?utf-8?B?cHV3TVNOQmpRRmdpYmNNaFVGdWJhRldPZ09kTXlJWVFkRUozc3FObTZxTnJa?=
 =?utf-8?B?WXZZZmZLZDJ4Q0czak9DZUdpcThtczZUZHhJM1dDUld1cnRPa1o3QzhINGc2?=
 =?utf-8?B?UlZhQlN6ckpPVEo0RmFyMlo5TjhHY3JoeFI2QWF2OXBBM3NhZlRBS3Bob1Jx?=
 =?utf-8?B?blJXRTNLVE1ZVTl6V3FMN3czRmVMVmJOTWZEOHpmeHJUZFFlMHVKRkhnYVgx?=
 =?utf-8?B?b3h6eWZkN0hMdTFPdFJmU0h6NWhUREJTblBLU1c1ZEZ2c1c0WWlMV0ZPVkE5?=
 =?utf-8?B?QXNkS0RvM3AxUEVHYXZuZVZPRGVvRUVjVWNUbXRhTWorLytYZllwRzNUejNh?=
 =?utf-8?B?QnZBQ1JWYi80dU9QYlVEOThZMjFQVWREd0JrNm9KRlNTd3pZTFBTVHRmNGto?=
 =?utf-8?B?Q2U2blFyWHNYVE5nd0NCK3dXemErck5leGFZeWZsTWVUNEM3MDMxaUxubHdY?=
 =?utf-8?B?bHhqUXp6a2pGWVJtd09LYTdyZWRZQWxiMkQwQWFmK2RCSEpQZElXbU9FK0R5?=
 =?utf-8?B?dzZUUGc5aDNnN090MGozTC9EekVNc2tMTkdka00vWUErWEVLWjJGQUs2NElP?=
 =?utf-8?B?TlBrZ1NnekFPeDlKRERHNTRuUVA1L3NsU29ZQzhuZ1ZHTzNiWDRCUnJiN2Mr?=
 =?utf-8?B?T1JiRm16MVVyU3JRV2pGSFoyaVRTL2lmbmF5eDRPbTE4R1JkNHc5Si9ZRUdC?=
 =?utf-8?B?azRKN0g5VWc0MjRNRUlnd295V2YwQjR6Q0xseDBtb3hNak9nVm02RnFuVXRR?=
 =?utf-8?B?cWc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d5a145f6-a45d-4f42-70a0-08dcfeedf078
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2024 05:35:07.4579
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MdIb37+Qydu8CZeRbPc3D9h/E8+24vyNat8Wh6OKaaTZbU7DcvRd9yEwIPR6tclOWT8KzKohwOqydIg9yVAn4Ul9UDrkgXm+wU3/aelSjfA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6319

SGkgR3VlbnRlciwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEd1ZW50ZXIgUm9lY2sgPGdyb2VjazdAZ21haWwuY29tPiBP
biBCZWhhbGYgT2YgR3VlbnRlciBSb2Vjaw0KPiBTZW50OiBTYXR1cmRheSwgTm92ZW1iZXIgMiwg
MjAyNCA2OjE3IEFNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMS8zXSB3YXRjaGRvZzogYXNw
ZWVkOiBVcGRhdGUgYm9vdHN0YXR1cyBoYW5kbGluZw0KPiANCj4gT24gMTEvMS8yNCAwNToxMSwg
Q2hpbi1UaW5nIEt1byB3cm90ZToNCj4gPiBUaGUgYm9vdCBzdGF0dXMgaW4gdGhlIHdhdGNoZG9n
IGRldmljZSBzdHJ1Y3QgaXMgdXBkYXRlZCBkdXJpbmcNCj4gPiBjb250cm9sbGVyIHByb2JlIHN0
YWdlLiBBcHBsaWNhdGlvbiBsYXllciBjYW4gZ2V0IHRoZSBib290IHN0YXR1cw0KPiA+IHRocm91
Z2ggdGhlIGNvbW1hbmQsIGNhdCAvc3lzL2NsYXNzL3dhdGNoZG9nL3dhdGNoZG9nWC9ib290c3Rh
dHVzLg0KPiA+DQo+ID4gVGhlIGJvb3Qgc3RhdHVzIG1hcHBpbmcgcnVsZSBmb2xsb3dzIHRoZSBs
YXRlc3QgZGVzaWduIGd1aWRlIGZyb20gdGhlDQo+ID4gT3BlbkJNQyBzaG93biBhcyBiZWxvdy4N
Cj4gPg0KPiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9kb2NzL2Jsb2IvbWFzdGVyL2Rlc2ln
bnMvYm1jLXJlYm9vdC1jYXVzZS11cA0KPiBkYXRlLm1kI3Byb3Bvc2VkLWRlc2lnbg0KPiA+IC0g
V0RJT0ZfRVhURVJOMSAgID0+IHN5c3RlbSBpcyByZXNldCBieSBTb2Z0d2FyZQ0KPiA+IC0gV0RJ
T0ZfQ0FSRFJFU0VUID0+IHN5c3RlbSBpcyByZXNldCBieSBXRFQgU29DIHJlc2V0DQo+ID4gLSBP
dGhlcnMgICAgICAgICAgPT4gb3RoZXIgcmVzZXQgZXZlbnRzLCBlLmcuLCBwb3dlciBvbiByZXNl
dC4NCj4gPg0KPiA+IE9uIEFTUEVFRCBwbGF0Zm9ybSwgdGhlIGJvb3Qgc3RhdHVzIGlzIHJlY29y
ZGVkIGluIHRoZSBTQ1UgcmVnaXN0ZXJzLg0KPiA+IC0gQVNUMjQwMDogT25seSBhIGJpdCByZXBy
ZXNlbnRzIGZvciBhbnkgV0RUIHJlc2V0Lg0KPiA+IC0gQVNUMjUwMDogVGhlIHJlc2V0IHRyaWdn
ZXJlZCBieSBkaWZmZXJlbnQgV0RUIGNvbnRyb2xsZXJzIGNhbiBiZQ0KPiA+ICAgICAgICAgICAg
IGRpc3Rpbmd1aXNoZWQgYnkgZGlmZmVyZW50IFNDVSBiaXRzLiBCdXQsIFdESU9GX0VYVEVSTjEg
b3INCj4gPiAgICAgICAgICAgICBXRElPRl9DQVJEUkVTRVQgc3RpbGwgY2Fubm90IGJlIGlkZW50
aWZpZWQgZHVlIHRvDQo+ID4gICAgICAgICAgICAgSFcgbGltaXRhdGlvbi4NCj4gPiAtIEFTVDI2
MDA6IERpZmZlcmVudCBmcm9tIEFTVDI1MDAsIGFkZGl0aW9uYWwgSFcgYml0cyBhcmUgYWRkZWQg
Zm9yDQo+ID4gICAgICAgICAgICAgZGlzdGluZ3Vpc2hpbmcgV0RJT0ZfRVhURVJOMSBhbmQgV0RJ
T0ZfQ0FSRFJFU0VULg0KPiA+DQo+ID4gQmVzaWRlcywgc2luY2UgYWx0ZXJuYXRpbmcgYm9vdCBl
dmVudCBpcyB0cmlnZ2VyZWQgYnkgV0RUIFNvQyByZXNldCwNCj4gPiBpdCBpcyBjbGFzc2lmaWVk
IGFzIFdESU9GX0NBUkRSRVNFVC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoaW4tVGluZyBL
dW8gPGNoaW4tdGluZ19rdW9AYXNwZWVkdGVjaC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJz
L3dhdGNoZG9nL2FzcGVlZF93ZHQuYyB8IDgzDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgODEgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL2FzcGVlZF93
ZHQuYw0KPiA+IGIvZHJpdmVycy93YXRjaGRvZy9hc3BlZWRfd2R0LmMgaW5kZXggYjQ3NzNhNmFh
ZjhjLi40YWQ2MzM1ZmYyNWINCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9n
L2FzcGVlZF93ZHQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvd2F0Y2hkb2cvYXNwZWVkX3dkdC5jDQo+
ID4gQEAgLTExLDIxICsxMSwzMSBAQA0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L2lvLmg+DQo+ID4g
ICAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgva3N0cnRv
eC5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvbWZkL3N5c2Nvbi5oPg0KPiA+ICAgI2luY2x1ZGUg
PGxpbnV4L21vZHVsZS5oPg0KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+ID4gICAjaW5j
bHVkZSA8bGludXgvb2ZfaXJxLmg+DQo+ID4gICAjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2
aWNlLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9yZWdtYXAuaD4NCj4gPiAgICNpbmNsdWRlIDxs
aW51eC93YXRjaGRvZy5oPg0KPiA+DQo+ID4gICBzdGF0aWMgYm9vbCBub3dheW91dCA9IFdBVENI
RE9HX05PV0FZT1VUOw0KPiA+ICAgbW9kdWxlX3BhcmFtKG5vd2F5b3V0LCBib29sLCAwKTsNCj4g
PiAgIE1PRFVMRV9QQVJNX0RFU0Mobm93YXlvdXQsICJXYXRjaGRvZyBjYW5ub3QgYmUgc3RvcHBl
ZCBvbmNlDQo+IHN0YXJ0ZWQgKGRlZmF1bHQ9Ig0KPiA+ICAgCQkJCV9fTU9EVUxFX1NUUklORyhX
QVRDSERPR19OT1dBWU9VVCkgIikiKTsNCj4gPiArc3RydWN0IGFzcGVlZF93ZHRfc2N1IHsNCj4g
PiArCWNvbnN0IGNoYXIgKmNvbXBhdGlibGU7DQo+ID4gKwl1MzIgcmVzZXRfc3RhdHVzX3JlZzsN
Cj4gPiArCXUzMiB3ZHRfcmVzZXRfbWFzazsNCj4gPiArCXUzMiB3ZHRfc3dfcmVzZXRfbWFzazsN
Cj4gPiArCXUzMiB3ZHRfcmVzZXRfbWFza19zaGlmdDsNCj4gPiArfTsNCj4gPg0KPiA+ICAgc3Ry
dWN0IGFzcGVlZF93ZHRfY29uZmlnIHsNCj4gPiAgIAl1MzIgZXh0X3B1bHNlX3dpZHRoX21hc2s7
DQo+ID4gICAJdTMyIGlycV9zaGlmdDsNCj4gPiAgIAl1MzIgaXJxX21hc2s7DQo+ID4gKwlzdHJ1
Y3QgYXNwZWVkX3dkdF9zY3Ugc2N1Ow0KPiA+ICAgfTsNCj4gPg0KPiA+ICAgc3RydWN0IGFzcGVl
ZF93ZHQgew0KPiA+IEBAIC0zOSwxOCArNDksMzkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhc3Bl
ZWRfd2R0X2NvbmZpZw0KPiBhc3QyNDAwX2NvbmZpZyA9IHsNCj4gPiAgIAkuZXh0X3B1bHNlX3dp
ZHRoX21hc2sgPSAweGZmLA0KPiA+ICAgCS5pcnFfc2hpZnQgPSAwLA0KPiA+ICAgCS5pcnFfbWFz
ayA9IDAsDQo+ID4gKwkuc2N1ID0gew0KPiA+ICsJCS5jb21wYXRpYmxlID0gImFzcGVlZCxhc3Qy
NDAwLXNjdSIsDQo+ID4gKwkJLnJlc2V0X3N0YXR1c19yZWcgPSAweDNjLA0KPiA+ICsJCS53ZHRf
cmVzZXRfbWFzayA9IDB4MSwNCj4gPiArCQkud2R0X3N3X3Jlc2V0X21hc2sgPSAwLA0KPiA+ICsJ
CS53ZHRfcmVzZXRfbWFza19zaGlmdCA9IDEsDQo+ID4gKwl9LA0KPiA+ICAgfTsNCj4gPg0KPiA+
ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBhc3BlZWRfd2R0X2NvbmZpZyBhc3QyNTAwX2NvbmZpZyA9
IHsNCj4gPiAgIAkuZXh0X3B1bHNlX3dpZHRoX21hc2sgPSAweGZmZmZmLA0KPiA+ICAgCS5pcnFf
c2hpZnQgPSAxMiwNCj4gPiAgIAkuaXJxX21hc2sgPSBHRU5NQVNLKDMxLCAxMiksDQo+ID4gKwku
c2N1ID0gew0KPiA+ICsJCS5jb21wYXRpYmxlID0gImFzcGVlZCxhc3QyNTAwLXNjdSIsDQo+ID4g
KwkJLnJlc2V0X3N0YXR1c19yZWcgPSAweDNjLA0KPiA+ICsJCS53ZHRfcmVzZXRfbWFzayA9IDB4
MSwNCj4gPiArCQkud2R0X3N3X3Jlc2V0X21hc2sgPSAwLA0KPiA+ICsJCS53ZHRfcmVzZXRfbWFz
a19zaGlmdCA9IDIsDQo+ID4gKwl9LA0KPiA+ICAgfTsNCj4gPg0KPiA+ICAgc3RhdGljIGNvbnN0
IHN0cnVjdCBhc3BlZWRfd2R0X2NvbmZpZyBhc3QyNjAwX2NvbmZpZyA9IHsNCj4gPiAgIAkuZXh0
X3B1bHNlX3dpZHRoX21hc2sgPSAweGZmZmZmLA0KPiA+ICAgCS5pcnFfc2hpZnQgPSAwLA0KPiA+
ICAgCS5pcnFfbWFzayA9IEdFTk1BU0soMzEsIDEwKSwNCj4gPiArCS5zY3UgPSB7DQo+ID4gKwkJ
LmNvbXBhdGlibGUgPSAiYXNwZWVkLGFzdDI2MDAtc2N1IiwNCj4gPiArCQkucmVzZXRfc3RhdHVz
X3JlZyA9IDB4NzQsDQo+ID4gKwkJLndkdF9yZXNldF9tYXNrID0gMHhmLA0KPiA+ICsJCS53ZHRf
c3dfcmVzZXRfbWFzayA9IDB4OCwNCj4gPiArCQkud2R0X3Jlc2V0X21hc2tfc2hpZnQgPSAxNiwN
Cj4gPiArCX0sDQo+ID4gICB9Ow0KPiA+DQo+ID4gICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBhc3BlZWRfd2R0X29mX3RhYmxlW10gPSB7IEBAIC0yMTMsNg0KPiA+ICsyNDQsNTIg
QEAgc3RhdGljIGludCBhc3BlZWRfd2R0X3Jlc3RhcnQoc3RydWN0IHdhdGNoZG9nX2RldmljZSAq
d2RkLA0KPiA+ICAgCXJldHVybiAwOw0KPiA+ICAgfQ0KPiA+DQo+ID4gK3N0YXRpYyBpbnQgYXNw
ZWVkX3dkdF91cGRhdGVfYm9vdHN0YXR1cyhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LA0K
PiA+ICsJCQkJCXN0cnVjdCBhc3BlZWRfd2R0ICp3ZHQpDQo+ID4gK3sNCj4gPiArCXN0cnVjdCBy
ZXNvdXJjZSAqcmVzOw0KPiA+ICsJc3RydWN0IGFzcGVlZF93ZHRfc2N1IHNjdSA9IHdkdC0+Y2Zn
LT5zY3U7DQo+ID4gKwlzdHJ1Y3QgcmVnbWFwICpzY3VfYmFzZTsNCj4gPiArCXUzMiByZXNldF9t
YXNrX3dpZHRoOw0KPiA+ICsJdTMyIHJlc2V0X21hc2tfc2hpZnQ7DQo+ID4gKwl1MzIgcmVnX3Np
emUgPSAwOw0KPiANCj4gUGxlYXNlIG5vIHVubmVjZXNhcnkgaW5pdGlhbGl6YXRpb25zLg0KPiAN
Cg0KT2theSwgaXQgd2lsbCBiZSB1cGRhdGVkIGluIHRoZSBuZXh0IHBhdGNoIHZlcnNpb24uDQoN
Cj4gPiArCXUzMiBpZHggPSAwOw0KPiA+ICsJdTMyIHN0YXR1czsNCj4gPiArCWludCByZXQ7DQo+
ID4gKw0KPiA+ICsJcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0Vf
TUVNLCAwKTsNCj4gPiArCXJlZ19zaXplID0gcmVzLT5lbmQgLSByZXMtPnN0YXJ0Ow0KPiA+ICsN
Cj4gPiArCWlmIChyZWdfc2l6ZSAhPSAwKQ0KPiA+ICsJCWlkeCA9ICgoaW50cHRyX3Qpd2R0LT5i
YXNlICYgMHgwMDAwMGZmZikgLyByZWdfc2l6ZTsNCj4gPiArDQo+ID4gKwkvKiBPbiBhc3QyNDAw
LCBvbmx5IGEgYml0IGlzIHVzZWQgdG8gcmVwcmVzZW50IFdEVCByZXNldCAqLw0KPiA+ICsJaWYg
KG9mX2RldmljZV9pc19jb21wYXRpYmxlKHBkZXYtPmRldi5vZl9ub2RlLCAiYXNwZWVkLGFzdDI0
MDAtd2R0IikpDQo+ID4gKwkJaWR4ID0gMDsNCj4gPiArDQo+IA0KPiBUaGVyZSBpcyBzb21lIHJl
ZHVuZGFuY3kgaW4gdGhlIGFib3ZlIGNvZGUsIGFuZCBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UoKSBj
YW4NCj4gcmV0dXJuIE5VTEwuIElmIGlkeD09MCBmb3IgYXNwZWVkLGFzdDI0MDAtd2R0IGFueXdh
eSwgdGhlIGNvZGUgY2FuIGJlDQo+IHJld3JpdHRlbiBhcw0KPiANCj4gCWlmICghb2ZfZGV2aWNl
X2lzX2NvbXBhdGlibGUocGRldi0+ZGV2Lm9mX25vZGUsICJhc3BlZWQsYXN0MjQwMC13ZHQiKSkN
Cj4gew0KPiAJCXJlcyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01F
TSwgMCk7DQo+IAkJaWYgKHJlcykgew0KPiAJCQlyZWdfc2l6ZSA9IHJlcy0+ZW5kIC0gcmVzLT5z
dGFydDsNCj4gCQkJaWYgKHJlZ19zaXplKQ0KPiAJCQkJaWR4ID0gKChpbnRwdHJfdCl3ZHQtPmJh
c2UgJiAweDAwMDAwZmZmKSAvIHJlZ19zaXplOw0KPiAJCX0NCj4gCX0NCj4gDQoNCk9rYXksIGl0
IGxvb2tzIG1vcmUgY29uY2lzZS4gVGhhbmtzIGZvciB0aGUgcmVtaW5kZXIuDQoNCj4gPiArCXNj
dV9iYXNlID0gc3lzY29uX3JlZ21hcF9sb29rdXBfYnlfY29tcGF0aWJsZShzY3UuY29tcGF0aWJs
ZSk7DQo+ID4gKwlpZiAoSVNfRVJSKHNjdV9iYXNlKSkNCj4gPiArCQlyZXR1cm4gUFRSX0VSUihz
Y3VfYmFzZSk7DQo+ID4gKw0KPiA+ICsJcmV0ID0gcmVnbWFwX3JlYWQoc2N1X2Jhc2UsIHNjdS5y
ZXNldF9zdGF0dXNfcmVnLCAmc3RhdHVzKTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJcmV0dXJu
IHJldDsNCj4gDQo+IFRoZSBhYm92ZSBvbmx5IGFmZmVjdHMgYm9vdHN0YXR1cy4gV2h5IGZhaWwg
dG8gbG9hZCB0aGUgZHJpdmVyIGp1c3QgYmVjYXVzZQ0KPiBib290c3RhdHVzIGNhbiBub3QgYmUg
cmVhZCA/DQo+IA0KDQpJdCB3aWxsIGJlIHVwZGF0ZWQgaW4gdGhlIG5leHQgcGF0Y2guDQoNCj4g
PiArDQo+ID4gKwlyZXNldF9tYXNrX3dpZHRoID0gaHdlaWdodDMyKHNjdS53ZHRfcmVzZXRfbWFz
ayk7DQo+ID4gKwlyZXNldF9tYXNrX3NoaWZ0ID0gc2N1LndkdF9yZXNldF9tYXNrX3NoaWZ0ICsN
Cj4gPiArCQkJICAgcmVzZXRfbWFza193aWR0aCAqIGlkeDsNCj4gPiArDQo+ID4gKwlpZiAoc3Rh
dHVzICYgKHNjdS53ZHRfc3dfcmVzZXRfbWFzayA8PCByZXNldF9tYXNrX3NoaWZ0KSkNCj4gPiAr
CQl3ZHQtPndkZC5ib290c3RhdHVzID0gV0RJT0ZfRVhURVJOMTsNCj4gPiArCWVsc2UgaWYgKHN0
YXR1cyAmIChzY3Uud2R0X3Jlc2V0X21hc2sgPDwgcmVzZXRfbWFza19zaGlmdCkpDQo+ID4gKwkJ
d2R0LT53ZGQuYm9vdHN0YXR1cyA9IFdESU9GX0NBUkRSRVNFVDsNCj4gPiArCWVsc2UNCj4gPiAr
CQl3ZHQtPndkZC5ib290c3RhdHVzID0gMDsNCj4gDQo+IFRoYXQgaXMgYWxyZWFkeSAwLg0KPiAN
Cg0KT2theS4NCg0KPiA+ICsNCj4gPiArCXJldHVybiByZWdtYXBfd3JpdGUoc2N1X2Jhc2UsIHNj
dS5yZXNldF9zdGF0dXNfcmVnLA0KPiA+ICsJCQkgICAgc2N1LndkdF9yZXNldF9tYXNrIDw8IHJl
c2V0X21hc2tfc2hpZnQpOyB9DQo+ID4gKw0KPiA+ICAgLyogYWNjZXNzX2NzMCBzaG93cyBpZiBj
czAgaXMgYWNjZXNzaWJsZSwgaGVuY2UgdGhlIHJldmVydGVkIGJpdCAqLw0KPiA+ICAgc3RhdGlj
IHNzaXplX3QgYWNjZXNzX2NzMF9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gPiAgIAkJCSAg
ICAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwgY2hhciAqYnVmKSBAQA0KPiAtNDU4
LDEwDQo+ID4gKzUzNSwxMiBAQCBzdGF0aWMgaW50IGFzcGVlZF93ZHRfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgIAkJd3JpdGVsKGR1cmF0aW9uIC0gMSwgd2R0LT5i
YXNlICsgV0RUX1JFU0VUX1dJRFRIKTsNCj4gPiAgIAl9DQo+ID4NCj4gPiArCXJldCA9IGFzcGVl
ZF93ZHRfdXBkYXRlX2Jvb3RzdGF0dXMocGRldiwgd2R0KTsNCj4gPiArCWlmIChyZXQpDQo+ID4g
KwkJcmV0dXJuIHJldDsNCj4gPiArDQo+ID4gICAJc3RhdHVzID0gcmVhZGwod2R0LT5iYXNlICsg
V0RUX1RJTUVPVVRfU1RBVFVTKTsNCj4gPiAgIAlpZiAoc3RhdHVzICYgV0RUX1RJTUVPVVRfU1RB
VFVTX0JPT1RfU0VDT05EQVJZKSB7DQo+ID4gLQkJd2R0LT53ZGQuYm9vdHN0YXR1cyA9IFdESU9G
X0NBUkRSRVNFVDsNCj4gPiAtDQo+ID4gICAJCWlmIChvZl9kZXZpY2VfaXNfY29tcGF0aWJsZShu
cCwgImFzcGVlZCxhc3QyNDAwLXdkdCIpIHx8DQo+ID4gICAJCSAgICBvZl9kZXZpY2VfaXNfY29t
cGF0aWJsZShucCwgImFzcGVlZCxhc3QyNTAwLXdkdCIpKQ0KPiA+ICAgCQkJd2R0LT53ZGQuZ3Jv
dXBzID0gYnN3aXRjaF9ncm91cHM7DQoNCkNoaW4tVGluZw0K


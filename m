Return-Path: <linux-watchdog+bounces-5026-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECNALb87pWmk6QUAu9opvQ
	(envelope-from <linux-watchdog+bounces-5026-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 08:26:55 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D4B1D3E26
	for <lists+linux-watchdog@lfdr.de>; Mon, 02 Mar 2026 08:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5FC6302297B
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Mar 2026 07:26:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB071339B1;
	Mon,  2 Mar 2026 07:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="CQ86e8Yv"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013026.outbound.protection.outlook.com [40.107.201.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154623FF1;
	Mon,  2 Mar 2026 07:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772436386; cv=fail; b=BLMew7rLW/UshkHT2acjzayP3Tk1ol3P7IorBg6GwORXV/l5vrFOotMA5cPAk4x/jMO27EiAFhsDwV8MlP0TFybI4SqL7f3B/v8i5ilBGTPDdI2F18U0Vs8myxUp0m/YYiw5RIqtPy4P+bFP/4L8hdB3jDhh6HjKl5mQN3EuBk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772436386; c=relaxed/simple;
	bh=gGpUtWx2CpdbUCSQlITX/DpSts6Dzq9OiPX/OhLHNRs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IF0yOX+U43en1hB5vfkvWVAtVTkcYeua6M70WpprXkBPkopb/qyFdHki1GdaiIcDkbBa4WqaHKPJPF6ByQli2S2D8cnnNf40Fid4519lZMsHcNG22H9Fk6H80FbU1fHz6fkNyJRcWNYA0ZGPMfz9BYJcRCe9qgiXUpeHf/73UBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=CQ86e8Yv; arc=fail smtp.client-ip=40.107.201.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCCvzIyPlsIZH785yOrvIq6EEELQQqgBbe0htLSSD/9Bu15IXTDxzfCf8fv5xSgLeX2sxzIzl2sCPGia2bMzPtEcuhwxvzf3TW1YPCBQAnfcBkfyuS6CG91qLz7w2jog2dPT6HblTWkFMsjvBMYwpeZBMxNPYWXAcmwpBjCcYvNPbBIf+7/il8isn3Yb0NLh3FP9iDf0mzTB3YDroHscMLT6DW8d2UZZ/IcWQc+mqkb99rWppaxsAcY7AXlut3ndKFfHaEM+g+tAiaff8V+/KynJuzXV6X86mgFgizSb6jDjzw8qOj60rr8m+gZLiGq7qe8D7oNa40z4XT6bWiwGig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGpUtWx2CpdbUCSQlITX/DpSts6Dzq9OiPX/OhLHNRs=;
 b=voge8RQKRKzaDF4r5IBoGH/B1zqWrZdqr0NuL0ORLvZZEc8ayR8kJ7Pht62doiUICUOnqsnpt0ghFZfI8XkWZwQ85NXh36MZgmZkGAYy1OIpili5iRUz/RcFNEpbT9MjWpID349mSigGwPvisRbdr2iobk3rmtlAc9dZi4ggl+NB2pabv/2WClhIGqQ4pQh/JqF/NFiHcG58P04/HAgmRP9Ft3GL7ESWMkdJFq5wQRJ0Y+bax1M90tWEjC8gVh3NPfM58u6PSo4YISV8P7FCI8j79oO+SPnpDr2qByIGxKw4A7XIMofq6j1KSKSnRlIB4VqgeTV1jY71gekoEl388A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGpUtWx2CpdbUCSQlITX/DpSts6Dzq9OiPX/OhLHNRs=;
 b=CQ86e8YvBn8Ux1zi6v5YUQtr9s/4XdAH/RG2ya0WLNNa7QM2bd0fIbuOMEvkfMMZ3SJ3Ih1z9jLfMMZ3kkkY7LkhLAfaXyqgLHZyT/BNP7QCgorhSb5wNZP97NyKNeWsFGhEMSaXBLR4yxTq6Y5gcvJpWRaWMnzzSAcEDMdTGaGsJ8WytI3SDWMqForqi1WE9nSR2H8HQ/kCSo+I3vERD7tN0ltHY8V7gnwdZoQ3G+JqPaMFAKkhcrEzOLsa7N3EvBiBbkMJN2LxPzu/8c80gFFzpTbgvU6D6d7HwRO/2kiZFMVaeFpeuGX72nJmubpqECV7E6Q28+G7B/UvW+T1kA==
Received: from CH3PR11MB8187.namprd11.prod.outlook.com (2603:10b6:610:160::18)
 by IA1PR11MB7824.namprd11.prod.outlook.com (2603:10b6:208:3f9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 07:26:22 +0000
Received: from CH3PR11MB8187.namprd11.prod.outlook.com
 ([fe80::ae7a:fa9:b654:1374]) by CH3PR11MB8187.namprd11.prod.outlook.com
 ([fe80::ae7a:fa9:b654:1374%4]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 07:26:22 +0000
From: <Balakrishnan.S@microchip.com>
To: <linux@roeck-us.net>, <wim@linux-watchdog.org>
CC: <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <linux-watchdog@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] watchdog: at91/sama5d4: header cleanup and driver
 refactor
Thread-Topic: [PATCH 0/3] watchdog: at91/sama5d4: header cleanup and driver
 refactor
Thread-Index: AQHcp7sWTpboeMkOzUqT90LMatIUK7WWKjoAgASyC4A=
Date: Mon, 2 Mar 2026 07:26:22 +0000
Message-ID: <660400db-d596-4857-be20-1ed2dbca7b6d@microchip.com>
References: <20260227073116.30447-1-balakrishnan.s@microchip.com>
 <e69972db-20c3-4ce7-ad12-bb91a8eadfb2@roeck-us.net>
In-Reply-To: <e69972db-20c3-4ce7-ad12-bb91a8eadfb2@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8187:EE_|IA1PR11MB7824:EE_
x-ms-office365-filtering-correlation-id: 5715d1d7-6219-409d-37e1-08de782d013d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 chlxoprl1oPgFC1Rqr6FcL0Geo2dUZO2DTIalRStl5amMOR0DvT+k4Y9dnMeLf5YsdM4zad2NkCVhCRQm+TumkmCx7TpvM7XBbtaD33BaoLvO1xWeY0jl36gUFKR2jSdCGEfM8yJLhnrum52Ou1UQZX0Vuxsd1tBvPdzwB1wuqxpQ946CCnYkRVkw7EjkomIr0PPWyMB2FWmg70ltpePA3jPaUZsk6/Ud0QOQD5hxPi6aZWIu2mVlhW1qoLrF4OZ2pBbd/h87rqV9BOqV6kmFbiHmXT593YrLfkEQ4mwA2zPk1MMlCKUnwS8sDGoz5MADAEWtnn5cLY61t31ipRTg8UmR3Kgf40ZfHKBT52yFojF5O3jOdOvjTBGBJaoRzi71Kck0Np80j2mJILnlGwEEhl+H+oCsMqUoJW1Ej73Cjydr0BOV6IRw02oIfGEutosPkD4FSEvqh/1vd57cp1wud2eyWpjFknEeon8QaP2us+ewVYziybA54aMbxRUmIXrctBMzhid7T51WIaUbKcaixNel03lLRMX9Tmhn3AlxORpUFzNB+fqP+tEelSa0D12dxOyMrJhgdkPn2UaX8dVi5u3TU5Ofzr+nqQAFmgj2fj+BvYliSFVEL0zkX3AhTnJAy5ISZQnOJ+1tEgDEchfoVMrw7cSe7ODnk8lbo8DVOZwEV8y1H2/NyGoaXB5EzxO3ttfLjTq8LVuFuPWyv7clwIoBP6p/dv1G1uej8MIA+STRhM/X8o2xVFBPw/VDM+7plO4Hd7FWCwTUNXt8FJY5SUFahUqK/9vgHqqxAKHir8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8187.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QndXSS9PYi9EMVU3bXh5MlFDVC9uY2F5SmplSHVDVDViYzl0dmU0WHVvY001?=
 =?utf-8?B?d2N2WTc3WW9ubjhnRGVRcGVSb0o3YXFCbUlYMUR6SEZCbk1xUG81anA1c2Mr?=
 =?utf-8?B?ZFpua2tZZnNrUVlZZlg5OHFQUmNWdlY2QkFWZzdvekdpcysrbTBzQ3l0QUVy?=
 =?utf-8?B?NmwwMW53ZVVaSEtWVlVreEhnQVE5T3czalJJN0lweW5qRkltc0dsNU1McGVM?=
 =?utf-8?B?UTZtUWkyRzZrK2JmSklKU3ZXQTRtVjhUQU1JV1F0a3I1QklFT1duYWlrbWw1?=
 =?utf-8?B?cjdGY0tvdVRXOXNQaDlTdG9wblNLTjZJUTNNdVMzeGdFOGw0MDJ2cmdGS0to?=
 =?utf-8?B?b0xoZ2ZTQ00zRTQySDJYWGljTit2L2ZWR05UQ0JFeFVPMlg3WUt6N0xydUtD?=
 =?utf-8?B?NXhILzA3OEJ3MlJ1am5IakhEN3BJY1dlWUxCOThhdDE1ZFV1NTZWdVN4Snl0?=
 =?utf-8?B?NUh3YTZvWUZnY1d5VVNBU0RCVTRYODFBWWlYVDNSbUJDVjV6RG5nQlIrMm5y?=
 =?utf-8?B?dkJ2SWRwaFBnSUppVnlTUElHd0tBcXpyd1hjajl6YzEzWWx4ZUw0SlVrdU5n?=
 =?utf-8?B?OHUwaSszckVicWpvWUxBUy94clJDZWs5Q0NVZExyK0paOENJbklVRS9HaERS?=
 =?utf-8?B?ckdsMGFFSU5BNGt0MlR2bDBkRUNnZWh4cXhYWVdEZDZpR2pxYlpZL2lOUE9G?=
 =?utf-8?B?SGRGeFJKNFZmOVNDcjNlc014V09oMTRWWHAyL2hEdnBkT2FlL3pNRGpPMXhX?=
 =?utf-8?B?eGtTMnlwZVIvLzNNTFZuOFZxVDl5MEhCK3ZwaStScSt4cy83OWdaYWhKdElZ?=
 =?utf-8?B?Z1Y3T2RPUFV5Q0R3ZkZ1V0NtdzRCb2ZUTXhsV3dmVTFOZ3FFeWF3c3lmRk5v?=
 =?utf-8?B?VEtBS29aV3Q5NzVlb2g5bTdiWEtuS1pNNGdZMXNpZVd5aEprWFhEdjBKUGVQ?=
 =?utf-8?B?dDYrdGI5aTBtbWRhQ3FJMHpXYlZoMWRoK3NER1kzMWFPYVI4VzNPQVFWZGNL?=
 =?utf-8?B?THpUSE5QMU5vU1c3MGhYdmFVNnJpY1RNS1Raem1DMWowSHl3ZEpyZ1pnYjA2?=
 =?utf-8?B?WWRMWlVoU0Z0dkx2WDJmWm1OMFgwNnRUS242QVdOZlVPeTJUN3NNbnZKU3p1?=
 =?utf-8?B?a1BZSm9PMDNXZGxEYzNJZ2lhQ3IrZFVGOUl5M1VFT0VNNXdLL0JIek80eUJ5?=
 =?utf-8?B?THRLYWVXOFk2V0U4N0hXTXhYQURwVHBLRjVzaFM3V2I5VnAyM25Kd1dHc1la?=
 =?utf-8?B?a3Y0c1o2TldmNjJSWlNoTlVCaDJHQUxkSk0xdGRVS1NpbEUxVGNPRGkxM1VT?=
 =?utf-8?B?UVp1LzVHK1N5ZzFPUERxL2FzcVUvT3c5dDV5cSt0VDNrckdnUVBVMDhaTFZZ?=
 =?utf-8?B?YTA0aklvazl5T1krZFppSmJ5RFphVTd3V21zeEUyUnI3cnJySTBCQmdIdFFI?=
 =?utf-8?B?aDNRbVgvK0RjaFd2dGhOVVVQSmdRQm5PdTJzbU1OUXJNa2NqbmVqRjNpVjRJ?=
 =?utf-8?B?MjYwSkxyODVTWFI0enFDeWtxRmphVDVhMjg4SmZnNTk3RW9xdnM2eG52bXVq?=
 =?utf-8?B?TGlvTzJLQnFVWmd1YXZwSUhYLzh2TFJoQnRkbEowSkltZmV2bFd5dUFveE1D?=
 =?utf-8?B?V2V1VWUyODNlSWJSMGJOWEhwUDFQbGQ4aEhCem5YMmE1NXFlczRqT0hVc2p1?=
 =?utf-8?B?bWFrT3cxUkcxanJYUTlMVTZxeVd0YWpacXYzeDZ1dGV2T010Rng2Wi9yVlJ0?=
 =?utf-8?B?VFY4b3JIR21VV0VBeEZGUFNpNEtDbzdrRDJGNUJ0TlBWTU9GbU01RzluMTZy?=
 =?utf-8?B?bjRweDErR08xSEJLajVDeUVXeVQ1T1dTUit1RDZQTzBYbmh0ZGlNZ29Kb21V?=
 =?utf-8?B?Rm9iYzZ0d0JQOTRianYvd1pyUjhtTWFDSE9tWXVzdXhMTDJWVjdTWXRsSk45?=
 =?utf-8?B?OFF4MTNMeW1sTVVXL3Rzb2xxZ21MS2E3dDFWdnlzblVPaGYvbm95dDhsZENa?=
 =?utf-8?B?eFdVL2hYenVwZHRQUWhFdk14SHE3SXVENXlsYWlreTZrWUVDVW9hRk0zbS80?=
 =?utf-8?B?QXUzcVlsVDAwMUpRUHdmYTB2aG5wQ1lwb2taS2FQVFkxVFdIRTQ0U2VBVnl2?=
 =?utf-8?B?bXoycER4eG5PcWhXL09YbkpYR1dUSWEwZUlqZ3kvcmIrTzhCNWRyemx2RGFI?=
 =?utf-8?B?cjUwVmM1VWdxYS90VDV0eGRzazloT2hWN3dHZlpua1dQL0NoeVhuT203dHpU?=
 =?utf-8?B?eEJXMEtlVGc2d0xmcWJ0NUI5Z0g4d1lEazQvZGJHTHI3N0c5dU9rdXZSOXJU?=
 =?utf-8?B?MDgweTI3bVdKRXNNV2xBMnVFYXhYdTQ2MXA2VDRSc3NXeFMrc0dnUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <57E358B076E06648853B4411DB109C46@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5715d1d7-6219-409d-37e1-08de782d013d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Mar 2026 07:26:22.2459
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bxiKZIUfUGSGRruUfniWZfEwHEI9728PzMa4GXTJMm1Ly1SYGaaVIcnZO2YnhL4t76/TTWyDsMJdKrJYPPIAQ/JCR7Chfk2iDBcE7lgYoc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7824
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FROM_NEQ_ENVFROM(0.00)[Balakrishnan.S@microchip.com,linux-watchdog@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5026-lists,linux-watchdog=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,microchip.com:mid,microchip.com:dkim]
X-Rspamd-Queue-Id: 18D4B1D3E26
X-Rspamd-Action: no action

SGksDQoNCk9uIDI3LzAyLzI2IDE6MTQgcG0sIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+IEVYVEVS
TkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IGtub3cgDQo+IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDIvMjYvMjYgMjM6MzEs
IEJhbGFrcmlzaG5hbiBTYW1iYXRoIHdyb3RlOg0KPj4gVGhpcyBzZXJpZXMgY2xlYW5zIHVwIHRo
ZSBBVDkxIHdhdGNoZG9nIGhlYWRlciBhbmQgcmVmYWN0b3JzIHRoZQ0KPj4gc2FtYTVkNCB3YXRj
aGRvZyBkcml2ZXIuDQo+Pg0KPj4gVGhlIGhlYWRlciByZW9yZ2FuaXphdGlvbiBpbnRyb2R1Y2Vz
IGNvbnNpc3RlbnQgcmVnaXN0ZXIgbmFtaW5nIGFuZA0KPj4gbWFrZXMgdGhlIFdERElTIGJpdCBo
YW5kbGluZyBleHBsaWNpdCBmb3IgbW9kZXJuIChTQU05WDYwLCBTQU1BN0c1LA0KPj4gU0FNOVg3
KSBhbmQgbGVnYWN5IChTQU1BNSwgQVQ5MVNBTTkyNjEpIFNvQ3MuIFRoZSBkcml2ZXIgcmVmYWN0
b3INCj4+IGltcHJvdmVzIHJlYWRhYmlsaXR5IGFuZCBmaXhlcyB0aGUgcmVzZXQgcmVncmVzc2lv
biBpbnRyb2R1Y2VkIGJ5DQo+PiBjb21taXQgMjY2ZGE1M2MzNWZjICgid2F0Y2hkb2c6IHNhbWE1
ZDQ6IHJlYWRvdXQgaW5pdGlhbCBzdGF0ZSIpLg0KPj4NCj4gDQo+IFRoYXQgaXMgaW5hcHByb3By
aWF0ZSBhcyBhIGJ1ZyBmaXguIFRoZXIgYnVnIGZpeCBzaG91bGQgY29tZSBmaXJzdCwNCj4gaW4g
YSBmb3JtIHRoYXQgY2FuIGJlIGJhY2twb3J0ZWQsIGZvbGxvd2VkIGJ5IGFuIG9wdGlvbmFsIGNs
ZWFudXAuDQoNClRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzLiBJJ2xsIHF1aWNrbHkgZml4IHRoaXMg
aW4gdjIgYXMgc3VnZ2VzdGVkLg0KPiANCj4gR3VlbnRlcg0KPiANCj4+IEFuZHJlaSBTaW1pb24g
KDIpOg0KPj4gwqDCoCB3YXRjaGRvZzogYXQ5MXNhbTlfd2R0Lmg6IENsZWFudXAgdGhlIGhlYWRl
ciBmaWxlDQo+PiDCoMKgIHdhdGNoZG9nOiBzYW1hNWQ0X3dkdDogUmVmYWN0b3IgdGhlIGRyaXZl
cg0KPj4NCj4+IEJhbGFrcmlzaG5hbiBTYW1iYXRoICgxKToNCj4+IMKgwqAgd2F0Y2hkb2c6IGF0
OTFzYW05X3dkdDogUmVuYW1lIEFUOTFfV0RUX1dERElTIHRvIEFUOTFfV0RUX1dERElTX0xFR0FD
WQ0KPj4NCj4+IMKgIGRyaXZlcnMvd2F0Y2hkb2cvYXQ5MXNhbTlfd2R0LmMgfMKgwqAgOCArLQ0K
Pj4gwqAgZHJpdmVycy93YXRjaGRvZy9hdDkxc2FtOV93ZHQuaCB8wqAgNjUgKysrKysrKy0tLS0t
LQ0KPj4gwqAgZHJpdmVycy93YXRjaGRvZy9zYW1hNWQ0X3dkdC5jwqAgfCAxNTYgKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tLS0tLS0NCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMTEzIGluc2Vy
dGlvbnMoKyksIDExNiBkZWxldGlvbnMoLSkNCj4+DQo+IA0KDQo=


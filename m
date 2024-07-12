Return-Path: <linux-watchdog+bounces-1367-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A20792FCB9
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 16:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E2F7281C37
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 14:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BB5171676;
	Fri, 12 Jul 2024 14:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="JEBU2EBr"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011040.outbound.protection.outlook.com [52.101.70.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3789916F83D;
	Fri, 12 Jul 2024 14:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720795126; cv=fail; b=dJp5H/o0Ng5gLX9PggdCuT6ChPzxiFuEvWsh/IjC58+VmbwIvnGbsmAet1l89GrYkDUPsyK8k2BrJKolwIVAmu3x25ZS6BvLxIu0DA5Pme0y1ykox2STRMVIIeFD67tcgG/DBPtmrvoL1mlm1n4sFHAid+bS7E2KRCwooq/O0Uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720795126; c=relaxed/simple;
	bh=mAEVv4jv8jB0upN/HbnAQ9swqabvg8Ucmr57Wv1n5ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GNJ0p0SnMqXnXPvC1VIpZTmvxuE4Q1yPEznBn/K/IvCKeH3HN4GMvZgcjpCkKLnuWuZ8H/T1RlJ2mx2JAy1dfKJd0oJvGaJGWYIOpdiB8kbiR/IxZ9rs5M3Zj4w8a+xczU2zfX6RDwoA/ERhLwoW7/RlsalyCoV5XUK3B81MUSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=JEBU2EBr; arc=fail smtp.client-ip=52.101.70.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQGDAlCfQ2PAkhzMnMgUs+KIKWjpqCthiZVwoc7cNoffIT/kpOAyMwH6fJhBkX6ZCubc820kJYhEfeycM3bE3AUYtDYR7pMx1YZ2SVj3tmrkWJFifwloPTWcanlTb+4YR/LRjSk9HK+3O5cb3Ie5voePEvWoZWrzIGM7fGO1lsuxplXr0v3U7sin/81OmBNqys70eQIMeyJAzrRjJ4HixJbzfWJ7p6Tp2zOmPS4ew0DKBSIvjgY6ib7FoHDNIl70XOXZgTfR1IthqMW0xq1BnabuoXvwNUpNBDN1f2Gul5jw50lTjvNb5C6ZGmSSdGRoh1CQDb17HYk5wyIjwAADVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OFibiSUdWSmgZHLbhCr6CGG96IlUJtht1FOTMCyjLA=;
 b=Kyi4f2ka1kJ4QTAn5IlnxGc2rzwtKBVkUD3JRDr3svWdK7irUgfjCY1b4U4wzaIAfblNvF5MORf2BWWKsTVyj6msDuanvihOex48+asTyK+z1FPlXtRXczLr+9JX6WE+kI0tay+Zy0xZozBtQLtdqw/5bkzTlJfVLlrDRD7oS0tT4h+QShcXmA1O9q0svLW+z3dOyehm4JPbcgJgw3OfhrRQZcqWL4ECniZv7SWpbeY88C1Lmw7Qr2wzx3f45YClDD9U7A/72VVloIlW5hPX6e99J4yETjIvd/el6o5KcBtcI0lfdBYUx0XBtxeYF3ytxxur5bqElmYcLZN8uDd9QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OFibiSUdWSmgZHLbhCr6CGG96IlUJtht1FOTMCyjLA=;
 b=JEBU2EBrV90P8yrtwnTp4+EqRD65RTKSKADPHjgAZloDL6CVGl2ib+mu8jPRA7CZEuTkxqZpiNQC5YrSVw2AOc1FV93/HplsGzp+ANy/gxauW3W728hxw4tXRhlr2ORgAOE5MgXSND1D0yxgRa3F7JehXWjnY+VkNJhzGUiWRiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GVXPR04MB9758.eurprd04.prod.outlook.com (2603:10a6:150:110::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Fri, 12 Jul
 2024 14:38:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 14:38:41 +0000
Date: Fri, 12 Jul 2024 10:38:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: linux@roeck-us.net, alice.guo@nxp.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	s.hauer@pengutronix.de, shawnguo@kernel.org, wim@linux-watchdog.org,
	ye.li@nxp.com
Subject: Re: [PATCH v2 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
Message-ID: <ZpE/6VM/DbCoVg5c@lizhi-Precision-Tower-5810>
References: <20240712141844.3274214-1-Frank.Li@nxp.com>
 <CAOMZO5DyP_V7+hSGm6q2ReTUhQ6ebTaLrx=qNhkuFSpCHc+8NA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5DyP_V7+hSGm6q2ReTUhQ6ebTaLrx=qNhkuFSpCHc+8NA@mail.gmail.com>
X-ClientProxiedBy: SJ0PR05CA0130.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GVXPR04MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: ab44da0d-55d5-4628-d7d7-08dca2805311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bExwVEtoNWI5K3lHVmpPVUF1L3M1MkZnaUlMbmtsMkNHUFZzY1ViSnBheFUr?=
 =?utf-8?B?c00veHZudys1VlVMTTVKbGsremVad05yd3dxVnBIUVlJSDQzYjBHN0t6M2dR?=
 =?utf-8?B?bndJc1psZXd6SkFXQm0wR01TcjZXeFZzTmd6eHg0bjFWdFU3Z3RLSFJUMzB6?=
 =?utf-8?B?VWluSmFucFpzWTFXR1pCR3JWZzRmdml5UGRDbjF2ZTRrZkNXcm5tODFGVXhx?=
 =?utf-8?B?dCtWWk9ZdlFpS2tYTXVaV3hZcFVaSnU0MlAvZXJjS2hoVXhGbk5Wb0U4TG5Q?=
 =?utf-8?B?ZUFMaTZNVEIxMUJ3SXBmckJaTUhjZXY4Z2NNblJHTXZLOG14dXBDbDU1N2Vl?=
 =?utf-8?B?WlJsOUM3SkRrQUVYeVIyeWpzNGFSVlJTK00yRmNmdHE5amYvS29rUW9vOVFZ?=
 =?utf-8?B?dzMzd1ZxS3RteVpPQVBiZVV2Ymt1MWhhQTgzK2Z2MGpjZnA1NDFDNFNGU2cw?=
 =?utf-8?B?eGJUSVJpdVdlTVdMWERycElwVnhoZ0ZBaU1jdGZ2anFTU1E1SEp3OEtFUG0x?=
 =?utf-8?B?emxCc2xveHpvcVE0SjRSMFcvdTlpT09NWDl5Ri90cVBBRE1BVVkvN3lXU2pv?=
 =?utf-8?B?cS9XbitFZ1R5LzNFZG02eE1rQzUvRndJdGZWMmI0VXFGbFhFcVRscUkyWHFI?=
 =?utf-8?B?eGFXQnRPU0J6ZjRJV1Q1bk8zWUYxbGpUbytyS2ZwdVhBbU1IZjFDWGFaaGtW?=
 =?utf-8?B?QVNqQ3RvRDlUUnRoSTg2amNyYWhMMnczL0VoT0VqcS9Gak9GZ3Q3RTVtdEcr?=
 =?utf-8?B?bFdmTmRsWi83RDVjeTQvZEtBamt5Smh2WmhRQW5sTWVJb080ejIvQmN4M0hh?=
 =?utf-8?B?eHNCWStzazFaZ1l1eWwvMWF4OW1ZemY0cm9PZmk0QW5sV05veUFSZ3lHdDRm?=
 =?utf-8?B?T3AzL29GZ0RRUkc2VFZlVUswNDNVWHZPRFR3Mk9HVEpVZzBhdHFTdVErUGU1?=
 =?utf-8?B?bkNUS2lHSmp1NUtVS0gzZENKa0U3NFFJVG10YVJoUHdoUHpHRks1UkdiSm5a?=
 =?utf-8?B?ay9kSU9UZzd1YmV4VnFZODNiU2JNbkdHcUdwYzV0YWlZOEdFbE50VlVhQlA2?=
 =?utf-8?B?MUN3WUp4c0Y3R05mOWFIc2ljNTJwN2czVXc2S29BV3BCc3hjSHBGcm5OMEdw?=
 =?utf-8?B?WUZkdVByOWY0S1VCNTRjTnE4Zm5iQTF1TTNBcWh1SUprRGNPcDhwbGtxd2tE?=
 =?utf-8?B?eU54WU5BK2phVm0vWjNXSHBBeDZBZGNSdE5ONVk0QkxLODJWSC9KNTJzc1Yy?=
 =?utf-8?B?cU9ndy9jejBlL2pxQnZJK3lUdGlaUjE5Vkk4bXdrQ0pYRWdYdEhvMXRBcExx?=
 =?utf-8?B?RXZOZEpPa0tEcUJyOVRFRnlzc2J6a2grdTNhWmlQR1JWL3V2WFUrUDNoRFFZ?=
 =?utf-8?B?UzdxZWRIZE9EODhhYm9XWUIxZG83YkVFMXUrRzhHeGZyL0s5NGpZOUwxNU9Z?=
 =?utf-8?B?RlVrbVhMaTNVTzAyWlM3OTNseHQyajUwRk1Sc2Z2NW9XSlpCSzJlUTdLQ3hr?=
 =?utf-8?B?WEdJeHNVcThUNHRsK2pGbFgyckFVL08rT2pER3ltUkxMRlZRMHAzaWZncGo1?=
 =?utf-8?B?cDFHUWxpM05PLzFMLzVoenJwb1orOTNoa0VieitJcXZ6VWY4QlVpUlRwaUVZ?=
 =?utf-8?B?cWE2S1pwRU1jYUJTcGFUanlQcnV4d3RvNmsvNy9XL25tQ3F5Nm5PV1BQb0xj?=
 =?utf-8?B?VE90SDdEZUdTVnlIcU1GVzNONW1yYU1rWXFScER4MWZvMCtzNmpSQUVpckk3?=
 =?utf-8?B?WnZKdGJFWisybHdHa09vRUxUMndhL2EyMnRLMGdNZmVuMkduaTdsL001UXJ6?=
 =?utf-8?Q?FUxjBA1mKMrw98rcY98yY4XSd9Oh13KD1aPCY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1c1WDF0MmlKMXlHSysxOXB6NXdRRUU3R3AyYW5lWFk0Q29MNFAzRXY1bXBi?=
 =?utf-8?B?UHpHWGNjaDREZWg4M3I0aDhiYVVoSDB4d1NDQkwxVC9BTFJFSUZ3RUVvY3Jp?=
 =?utf-8?B?WXh1UzNrUGp1ak40NmUrZnVKRnFZdzlFU3FxV1dUeTA5L2JyVzh2bnN5Sjkz?=
 =?utf-8?B?cHFtcGJ1akJwY09yajFaNXFFakdVd1dObU9DVFRDMmlvdy83eUZOa042Qm5G?=
 =?utf-8?B?b2NSM09KQ3RFQ0VTYk00Y3E5ckRCYzE0a0wzWUJIN3M1MjNCeXB0bU5ibjJT?=
 =?utf-8?B?K1dyMHdjc2NDOFk0QTlIakwwV3prczBBVlk0TGFVM2dIL28wbVpkWnhJMzV6?=
 =?utf-8?B?TGJEcWRGNmllRTFVbFByMWxabG53WDhxbExjeDNLS0pqVEZLbi82citpV21Z?=
 =?utf-8?B?QkpCM3BkRjA2TXFVVzVFV014SDBZQ1B6V0xXU3BEK0VnTEdFc2twTTNJQjFW?=
 =?utf-8?B?dDdmc2JMdkphWXM4MS9HOCtlOXhtZ29rb3hwemNrd0oxWVNzSEljNUxhWk5P?=
 =?utf-8?B?WjFpdC84cncwOEFhYzJNS25hMWNWMnhIaVhxSFMvNzZwSnRIbFJSdVplWWhj?=
 =?utf-8?B?R0thcHU3ekNoMis4MWdZSHl4RkxtTGJqeklwRXBCa21iR1M5THZ5Z3pzL0NQ?=
 =?utf-8?B?U1BsaUpHNFp6ZGdEa0RTTHNDSmM1aUMvY201K1Y2cmlpc2drM3I3ckRBVktN?=
 =?utf-8?B?VnZybzE1TmxwdmtHbVBWaS9nM1dOaWRDVFhSWjVoOFEwcVF6RDVDK2t6bytt?=
 =?utf-8?B?UTRQZ1Zqcm1uY2d1OUJQRXUvNFM2TUVxRXQyTjJkYWFaaE9uZE81cVFvSlQ0?=
 =?utf-8?B?UFpDU0VnOUFSV3NxcW54c0F3OURJNjVPT29Eclg1Ynl2VTZkSTd6bldBblNE?=
 =?utf-8?B?Y3hYcmF6U2dGWnRMY3dvWkJpU29OY1pLUTB5SUN2dGY1VDlQSzc5aEF5ekNv?=
 =?utf-8?B?Tjl6SUNzaDNudmZiNTNhZ0Q3MW5MdUlheVNkVzVNL0ZaUFJlZXM0UU9VWURz?=
 =?utf-8?B?VEFuUkVCT0NuM0drbENmMk5vN25PWkc3Q3Nxd1pMaUdZbEF3VEtPWGNSUkky?=
 =?utf-8?B?TFFrcEVNNTlNQlVENUJYcWo1NzVxdWNqczFkME1nUTFVVmx4TDhIS0xVYUlz?=
 =?utf-8?B?TUlOM1NQNUxCcUJyazBpV0xrMXZiZUlLZzQ0bWZXa1ZCT01iMUFQTlpNTXZI?=
 =?utf-8?B?amVadFVCb3RkSWhabEVXWVM1VzRhZVBZeTdTYTA4dGZqVEJMck8vc0x2YWk4?=
 =?utf-8?B?UmlKTHhqTGFySzdiVUZ0M1VtdmVBZGd0VEdJdXlUVWE4ak1hZFFIUndXdTFN?=
 =?utf-8?B?c2pIbTVpallGUTgwbmNqOGwzMmNRdTIxSG5sTmJ3NVl2VzF3WUg1OG5NVHBJ?=
 =?utf-8?B?NTdLZUZLMXZuMkZYM2cxYk9KZmZmTUpScGhXSDJkUW1aeEhLMG5sSHhFOElx?=
 =?utf-8?B?L1Z0L0lHOWY2eVJ4SWNYNkdyWEN1ODJRQkFRRUFEUDF6NnpjZUtkcnJ6SWNq?=
 =?utf-8?B?YjFybnVtQlNnZHFCWGdRQlliNVFmNlZkQlF3bmoxTHQxTnBvYUVjS0hEVGxn?=
 =?utf-8?B?aDYyd1Jhd2IzUnVnbFRlMzNybTE4RjA2RC9hUHJIaWFDWWF6UUlCeCsrQ3ZI?=
 =?utf-8?B?SHo4VXJFVjExMlhSNWNsZ0dwVFdHVHBldTQ0RVNHenpGd25hdXRDd0JNWUto?=
 =?utf-8?B?bmdKRjJac3plbE1PM3NoaWN3UENiQjJrNER5MUxxeUNPS2RNb1ByUG1kT1dR?=
 =?utf-8?B?ajhnOGdXNDVWQzBjd3JiY3dManE2SGtZUnk0YnYwNnhUbXdDT1VFYTZrQURO?=
 =?utf-8?B?V1gvOHJTanVzSGtFMk5XMUJ3cENBcTdPODZ1Z3haREE3U1p2dDNZcGVzTFo0?=
 =?utf-8?B?R0RzOEVGZnMya1pnWUlzNHp2cWdTTFpCRU1iaFVzSnlHZnF6Z3JiSnVyWndI?=
 =?utf-8?B?ZVE3cm9aSGtlcjZNaVd3NXAzdU0xdVpPMk8wS0VDSFFocEpReXd2NWFNN0ZK?=
 =?utf-8?B?dkkwd253RnprVVRzWThhMmQ4eXExN2hlcTV5aHd5RnRaUlNIR3IyUGdId1Bx?=
 =?utf-8?B?VGtGc1NDU0hWOGIyUVJwTlJLL3FQRC9xMkNwSkhOSTlDOS9GbTU5cldpaUJH?=
 =?utf-8?Q?xciqhnGiXsUHmA65zfXSavLRu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab44da0d-55d5-4628-d7d7-08dca2805311
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 14:38:41.4151
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o1WUL5C9nqRE6RTkLvvQ+lbZ/FM1l0Wz5mIAEJBGnUsCN9dpUeJKu5GQfieg+DUnTU96vFe7JnonQuxtBBAmsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9758

On Fri, Jul 12, 2024 at 11:30:14AM -0300, Fabio Estevam wrote:
> On Fri, Jul 12, 2024 at 11:19 AM Frank Li <Frank.Li@nxp.com> wrote:
> >
> > Move post_rcs_wait into struct imx_wdt_hw_feature to simple code logic for
> > difference compatible string.
> >
> > i.MX93 watchdog needn't wait 2.5 clocks after RCS is done. So needn't set
> 
> s/needn't/does not need
> 
> You mention i.MX93 here, but the code touches i.MX8ULP. Is that correct?

Yes, default is disabled. 

Please ref v1
https://lore.kernel.org/imx/20240711-wdt-v1-0-8955a9e05ba0@nxp.com/T/#t



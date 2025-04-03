Return-Path: <linux-watchdog+bounces-3194-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C7EA79BDC
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Apr 2025 08:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FE793B2918
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Apr 2025 06:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B701C1946C7;
	Thu,  3 Apr 2025 06:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BqHWgXmZ"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2076.outbound.protection.outlook.com [40.107.22.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678EC1A23A2;
	Thu,  3 Apr 2025 06:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743661167; cv=fail; b=SARnbPLRkHTved6WmqR0DHbAS5whJnDsLtp1T4ROQTMyUf/vYj0nhECuEr1cHDy3HshqSXOj+i1SuzlR6/Qpluo/kQSPfzgz2mDtW/yOSTAmgky0lr5VjIge0TyiEZr5/kXZfOOWDbTZ1sh4CtdiZ6JmAXFbgoiT+fpdpZxW2ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743661167; c=relaxed/simple;
	bh=EGRD0EspTJZhti+O2xEGV2+EBYeblktPj+Ax2Eli3Bs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RUeDrfbat5HCog0EgJX3wTUH1gH+QOEN3dLz/21FDbfOR8j9rcFI6O6bQ3LQ+YTySPmPdrzk555p9fyJquMv7obWENpHxtiPd7kFsEvyXywclQixqhtk6x09RZeDc1vYxaVPp/AwfKIC7C2OWjAGjATcsPR2zgfSj/HfoZoe03c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BqHWgXmZ; arc=fail smtp.client-ip=40.107.22.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEl1/8dDG3mrgj2SP1rdS/kvJ4HuMi+wONsmCVomYOPhO0T2yFPDzY6sTTWArCTQcmcRXYeC7Er8SDb3KwxUSv6JV6iJRBSrvTMQNF2qTQy9uiT2BfVsHa0NcFgzIYGw33DvcIT+ik5lhSO7h6IJ6esYGN04kOzBYAu94tGgP8XvXl2Mfaml6AIbLsSnZZ8lRdpHwvtJRfNMQFsI0fRSjHm3kyjhfhhp/pzNSTndUbwW5o8XUFZtQ649sFjnRCZkbKM20I+z3Gp8QrmaEpwKm9IWJ+I2EkJzc4y4rdw1R0Nxq+DSCbIZLYskKEnIQ//lXNbvZ88PZRu5JQ7o7aE0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUT9HEDWiL4hUQopaTsLGi/xY5VZuE3faxfGZnA127k=;
 b=UMvM6/hK2GJBOIaRhA0HgaL37orgysZxElGc9q3PSxlzQnPIpI1vxBsMV1WyzX9s/g9iV0D2qS9Z2Bn0iQxBTdxzd37AHwQGMpGrf81fqD/h1aHBKHcAoJ/Yb6vr4u7Q8SP98cy/MNqFA3HhEj7hi7wJwCRJzOQEWDeoX+0X3Jy+fmdVE3bZvbxnzuXQWTm+eADp9Sxa/BKdxGi6da627XNijNg577WocBZhXECPyryiAl7I92aAgTT9EGK355N5Y+mYsBfPhl/RjuspTS0V1Gb3Yk/Vq84bmneNB9O3X4RgH0altLtYDibBKrBEzHU/a4pOqmZbCnFpCukOVNPjMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUT9HEDWiL4hUQopaTsLGi/xY5VZuE3faxfGZnA127k=;
 b=BqHWgXmZuQQ73yTucvROBtQ3w44641RB3p0LEg+pXykimZK3ZdIzCka8LAvvrCkAcnLrLdaQqif0TGHuueJI02OF1VbV7nIsL7R9d6VnHB1NCbKqKkklcrtyQTw1nwnHKGKBCa6b828klBIRTa7uJZT+E+w7A4sziOtfpeGbz4uR3ANAHQw0pMc2z1SYL3ibhnNgLrsPQS4sChWTPtQFAlBDnc5OYNYDIfhgytzlKy4UB7imnffYU3kZGeZNgXbyzEpdew+8Ei/E9cqfimxo6AwNKCuxLz0Xr6cj5is+8Tm9490HHpKwiDmeNIyloUJEITcyDBDh7G0AdRSeUbANFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by AS8PR04MB8596.eurprd04.prod.outlook.com (2603:10a6:20b:427::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.43; Thu, 3 Apr
 2025 06:19:22 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%5]) with mapi id 15.20.8534.052; Thu, 3 Apr 2025
 06:19:22 +0000
Message-ID: <64b6d599-fe67-586a-e4b0-73d9b73499de@oss.nxp.com>
Date: Thu, 3 Apr 2025 09:19:18 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add NXP Software Watchdog
 Timer
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, wim@linux-watchdog.org
Cc: linux@roeck-us.net, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org, S32@nxp.com, ghennadi.procopciuc@nxp.com,
 thomas.fossati@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20250402154942.3645283-1-daniel.lezcano@linaro.org>
 <20250402154942.3645283-2-daniel.lezcano@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20250402154942.3645283-2-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P189CA0062.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:659::9) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|AS8PR04MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e98128f-115b-495d-cead-08dd72777924
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUJWcWlta2JQMjBnVkxJZ3FXNit4Ny95anlkSzVDaFRwejBJbHR3eWRMUG00?=
 =?utf-8?B?VGhHMmRGWElmTWtwRGhzek45MFNxSktBZjlaSG9iT2syZDBuS2hBT0tnKzhr?=
 =?utf-8?B?NVBQbFMyTWY0c1RuQXM0TVYwVlJsdnRrQkx0RG9mWk5COFhZMnZsb0cvS0Y2?=
 =?utf-8?B?RDlYWEF1VXBFTk9DS3hUSUs1NTZkcmtpSTYvQ0tiQlVHY0Zqcm1wNFRES3FI?=
 =?utf-8?B?RnhvWEpwOTFkakVSQUJqVERzUmFXbkJpZ1loZXBqSFRHaUNrSWRFUC9INTQw?=
 =?utf-8?B?WHhXYUNXbGE5a09DeXJPMDYyR1R5eTIxSjRtczhQY2daSm9xVXRmQ0YyR2VO?=
 =?utf-8?B?UUNKbEZjTTZRRlQrNm54b0MwMm1MMFVMc3NjdHgxMzR5cVVtU3NBcFNhaEVu?=
 =?utf-8?B?cm8zeEFkcWFwZTZhZjg5Smt1eVRkbUxWamN4RE9ZM2ZOeVZTanVxd2IvcmlP?=
 =?utf-8?B?Y3NjUFp1TmM5WVFwczNXMW9VSHNDUnNvY0RNbTBPeTNBZ25rNVFLSS9iNVhS?=
 =?utf-8?B?eGgraVpIU3QvNDQvc2Z0bld6aXNiOVNCYzk0NkQycWNpaU9ZYVlJV29SRjNK?=
 =?utf-8?B?VklWdWdTTGl1ekgvMXRhWk1vcUR2KytzeEo2bGdYKzhTc2JZNGp5SkNIaXRh?=
 =?utf-8?B?OUFGejcrOEtrM2FHQmRxL0VHa3BKaFRSMW01c0kwdG9ERkY4ZVJVTlYxUUls?=
 =?utf-8?B?ZThTOXRBK3NzcXVyQzR6QVhRaVJXNXg5QjZWVjNwOHJnVHVaeTUvcTBYRmtn?=
 =?utf-8?B?WnRrNlZjbEQ5UWNNa0xXa2dublBjMldqNDlsSzVyeG04SDRUWGxCMHJDdTY3?=
 =?utf-8?B?bzdnbUZTVlFLZzhQVUxUcEFERTFiRmNHNVBEZi9SWldKSEJMY3pBY2R2YUQx?=
 =?utf-8?B?emU5RS8wWUJFZERFVkdkamdlWFdvYWlFZlJGUjJacVVxQzkvSkF4cWRXNC9K?=
 =?utf-8?B?YVlzYXFoWFNycHVOR0RWM08zbmNzRlIybXBzbHdydzlFM0VqQzhHUmtLU0Ex?=
 =?utf-8?B?cnpGQkJDM3hJVzBUWm1FSHZmU2h0TTMyUzRxbDNwaHJoY1BlenZVM0ljTU1J?=
 =?utf-8?B?aTJDanFweDVCOCtaQzN0bHhSTDlBdUFIdkI4M3BXUlBQWE1nZGpCcUI5MEtV?=
 =?utf-8?B?OW1lY1l5SEw1NVJLcW9rSGhrbEJiR0pBRUZuYVY3SDN6cUE5dWNsREhMSTQ4?=
 =?utf-8?B?V3RJVzBnZkFiRVljZlRVSHJLTTZMa3RlbzZ2STZpOUI3QkhGVjJ6MmZsSzJz?=
 =?utf-8?B?OU5Pc2pjNGNsMXkvdVE2NTNXR2tmSG9FVHJyQTBxdWZxaVVpeXZwcGszdmtS?=
 =?utf-8?B?SzU3c3I2UFRVRzZVZWw4WWpYT2xmblY1OGMvM3dWaUE3WHBlUDQwd3JGYzJh?=
 =?utf-8?B?QWFSeUhlMm91UmtlRmN1UXJxbHZCV1N4RzZnRExnRjhUTm00TEdvUDNLN2F1?=
 =?utf-8?B?WGpvRlFaeXpQdEExZzIyVVVnZlduSXZLQmhaR1E0V0JlOXlzUktmY0pyS29X?=
 =?utf-8?B?SFhnNzQ1WGEzbUFGWTRIWVlHQlMrbkk5SDFkOUJsSDU1bzZRRDBobCtyZkNW?=
 =?utf-8?B?VS9QUUd3Q2Z3MDJGVXNmOG15Vi84eWd3ZzN2dnhvbkhYbmM3OFVEWXZaYW04?=
 =?utf-8?B?TFIwbytjL2FjTnBnd2RyWGlGaFlvY3lEc0FUQ2pucURDRWQ2TmFaNVZ3d3FK?=
 =?utf-8?B?S1BIejBFUDJJakx6UTlHVTZOWWJCZUJsQnRNNGFjcDhrOHUvTUdBZWtQOGIx?=
 =?utf-8?B?VG9PRVgzMlJCLzAxZ21LQktsMDNndnlKdi9xMGxJNVAzMWpVRkxtOU4xYWdW?=
 =?utf-8?B?MVN2djM1UGplWFdUODRIeU5jWU1HZGg5aERCYUcwNC84Q2pkT204TlVHNjFD?=
 =?utf-8?Q?Tl6iH48j6tPYA?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXNoeEQ0Z0hMck8rYy8vNWgybExnbjNjaHR4ZWFSZFFhMEtkekdFbklGbitJ?=
 =?utf-8?B?UGtLN3RLWmRGYklFb3NnK3d0Rmx3dFBqSDBkVUl3YkdFQStWbnpuejFwSGwx?=
 =?utf-8?B?YWY5N294RklMWVlBYlErWTRlL2ZxdmtwWG1WQVZPZXBqNXlVTDEvNWU0cnB6?=
 =?utf-8?B?VVVsNHVMa3A1N3V1eG1CNm1CU3BJVlBqRWJCSG9ZN0IzS2ozdGpuaGJrME56?=
 =?utf-8?B?amNCeWcrQVhmS3VLRml3YVhKdlptSkNxbGJkdXF1bzhRTE5VRUc0UHY1SjhY?=
 =?utf-8?B?MWk5ajVUMEJvYk9CaVFESkZucVZiL09mUUgvTi9WMVN2MmJVd0l6NHQrd3Nu?=
 =?utf-8?B?NE5ub2owWW9obHIzUHF1NGphaU5JOUV3YnRieGdEd1UwTVJUVUp3cm43TlJE?=
 =?utf-8?B?am50dWh3OW05TVdjK1VhVzlZT1lqN2k2M1IxTHBTcWdPV2VNVENDNnJhZi9H?=
 =?utf-8?B?ZW15SE9ZNXE2a3djdjJ3SHREeXBlcHNjV0dRQll3QVFyN00xY1d0SzVYcEIw?=
 =?utf-8?B?T1lPYTZYanpuYkxSVnh4a1hRNVFUdXpyQXAwYkgzY3FCcytmM3F1SThBMW02?=
 =?utf-8?B?MzZ5NHpiYlFWUjY5WDBZTVRXdTJheUdRdndyUnhnS3pqZEhjRjQxVXB2b1ZP?=
 =?utf-8?B?MkZrbkx4Z2IwNHJBMkRsZk9NUmhyTzMyUFVwZWZ0b2VYT1REK0hiSWM3YWdo?=
 =?utf-8?B?RlBDTVF1bmVWV3ZaZ25qNFZIUzRTMm5LY3VLUE92SmFvamNDZ3FsMThNM3Ir?=
 =?utf-8?B?a2szZlMvYTN0blhkTkxYUkxKbTNsdTBiUVp4cVE4SWxKTGxPSVluL3JWeHRx?=
 =?utf-8?B?enhCZHBrbVZZdDdCRkdRZlVNVlg1NzVYcElTN09Mek9VNm96ais4elNiVk0r?=
 =?utf-8?B?NTl1b0piZmU0SWxPRGNVZ05LQnBMM0pZeXRWUzVEMzR1aC9Ybm94MU5Kb3Z3?=
 =?utf-8?B?RTFVNkJLQTQ0cVByaWk2SG5VK0Q3VXVHbGkxeG43S09tOVhBTjZxVnYzMDZr?=
 =?utf-8?B?LzNwVWtyR0VkaTJ2VnhZT1ArSVJVTFA0RjhEWkl5T054c09zRFYySzFvN0Rq?=
 =?utf-8?B?dWxLa0RMQmt4R2lZMEFrODQ1SXhDdGhoZE1EcitZZ204dlVNQnlEOEhVY2xF?=
 =?utf-8?B?MWlFb0k1UGo5ampTc3JvemRIRXhMTDlWRldmU0k5YlN2UmozakIvU2czZ0lY?=
 =?utf-8?B?UU1PTGg4Z3lJYi9hR280ZUh4c3MxNVBiZnk4OXQyUDlJRytHTXpnaTVvd0NG?=
 =?utf-8?B?bUkwUHBFQnd6U3MxdW1CWnNGbkNYUEExSEZxeDRqU2xKYUZ4OVcyeXUrR2Jy?=
 =?utf-8?B?aWJteUhvYTk3ai90dldsR2NVUVk0UTI1a1pSVUtleEQ4YWtwRXNMdVc1OVdO?=
 =?utf-8?B?bGN6dENyTmhROXlOVXRuOGxxa0lpTktyVmJUd2FLSDhjR29MQThlSldmUjA5?=
 =?utf-8?B?NkRFNVB0RE5wTTJQVFVEZ0x5emRDTGxudG45Rit0cXF0SG4xd0pMWXFoRFRP?=
 =?utf-8?B?bVJXUllzS0xaYlR6Vm0vcVJRaThsWG5ub2RrYTNkZjM4Z3RKbVVTNm5IN2NF?=
 =?utf-8?B?eW82dFY0OU5JMGpyaEhoTDZZaXJ2U1RDaC9SZzdxaUJ0cUxqZjZMREQ1alhn?=
 =?utf-8?B?TVI2NzdQUzA1SUJSU1hpc1RWY3hoTkRDdEFibElIS1RrYzJmNit4dUJQK2tC?=
 =?utf-8?B?U04ra2Zkc0lzNEsxRE5EQ3pCN211bnArb1Y5M1NFblJ3NmxodEFIQ29NQW1E?=
 =?utf-8?B?MkFNTm5qdUpDc3BsaERKdklIUjU4d0JEaERRT0orbmNGYVNoejdJK2ZHTnZq?=
 =?utf-8?B?djRRRzFFQkV6RWtTZW0zdFR4Nkduays0NG96UUEwRmpBOG1qUmw4TkN3WUdl?=
 =?utf-8?B?UnBId3NyRytrS1pxcjNnTlFUbGMxZmVIR01yWVhnSEMvQjdXWThTOEp1SzUz?=
 =?utf-8?B?WlJSVDJjWkZsa2cwdmtzVTkxUzVxai9Ha3cxODlzRXpCQzJUa0ZjQnhONHZz?=
 =?utf-8?B?N2FyaUd5TFVjUzM0eDNzbVlGQUFtUi82a28wWG1hNi9rdWUyOGt5Um55Tkd5?=
 =?utf-8?B?bWpFRHk3OVFIMUNtUnZsVXFDb2hyTHc4djMrQnlOeDZkS1pxSDdUQzYrUWtC?=
 =?utf-8?B?MjFldHFNeFhpeEx4Smptczl4MmNZTFlFU0R6RS9NbjJmSllCRy9odUhSdnNx?=
 =?utf-8?Q?gkM6Pb0xwnJx5/T/oMHK1P8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e98128f-115b-495d-cead-08dd72777924
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 06:19:21.9734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xCs1m55oRzqH3btUMHMqPIA2oehSRSJm43rZLCHEFp6KAW6B9ZdGAR2TaXBvQ3Y+WDWpUdtGbDqng1TE17wiKmphLvYCJ6lIw5nPekJq/jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8596

On 4/2/2025 6:49 PM, Daniel Lezcano wrote:
[ ... ]
> +examples:
> +  - |
> +    watchdog@0x40100000 {
> +        compatible = "nxp,s32g2-swt";
> +        reg = <0x40100000 0x1000>;
> +        clocks = <&clks 0x3a>;
> +        timeout-sec = <10>;
> +    };

The S32G reference manual specifies two clocks for the SWT module: one
for the registers and another for the counter itself. Shouldn't both
clocks be represented in the bindings?

-- 
Regards,
Ghennadi



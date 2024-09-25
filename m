Return-Path: <linux-watchdog+bounces-2025-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF14985262
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Sep 2024 07:26:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D09B1F24E22
	for <lists+linux-watchdog@lfdr.de>; Wed, 25 Sep 2024 05:26:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D36314B967;
	Wed, 25 Sep 2024 05:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="n+SHadMk"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2040.outbound.protection.outlook.com [40.107.103.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796CD14A62F;
	Wed, 25 Sep 2024 05:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727241976; cv=fail; b=GiXlbEUKOHAicATylZzLcyys0MLZBRiQAgXK89hGfOYnq/2a5zI+4PKlguJA36BS4jZVGugL3L733tVeMqu7yuvR3oeCKzUiFeLU+oRv9iidB/MgqBZrL7tuILUWLlByqYm4BVlT7cU0EbIFy8e406iBcm6+6mcziJLTicKXciA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727241976; c=relaxed/simple;
	bh=/Db3pWOnIat6fvW0r5Z8RfQ3U/gq6CkCb+1+2qj0m1k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AnyB3T1+cqOLzMKYWx3GkKKEQEdvnU8BnnHsAZ/7f4WCSnilC8kDUGULfdAoYPl0baEuAIOLpYCIgf75sFE0E9Hx4yAn9n2txaXhiP5Sclys8TFpp3vjGQcpGewdModhkBi4P+AEV7RNArO1Z9FHUnQ5AJ0v27GpQj/e/bn2dBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=n+SHadMk; arc=fail smtp.client-ip=40.107.103.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vsQVi5ogHH4zQGisu/5wP0+JDciQSKhfD8LZufsvL4NAfaREuT+E4VJZl4nYcH6q/otAH0s1JggFtxj/UgNvkB+J2KeDGw6DlrPnEuQEvIa//WyPTZ5pp0flvEKyvO6A0NtJ8u9wnRsW+wiYJzYmitphlwVwZfw0SLTWe02Xhr7/y1MuMMmLJRcnnBpTMYP3ZQTebw45IR4IX/HvZVqjVut0hmWm3DGotea030TxC9anzDyTda+Im+7vnM/YVZcz+NxMy1d67C0QZI3RjIk8bFGwChkmUz3sz+cZdu36qoVQfNTnO1ynpnRMtCdN35LJ5v8iYSKq3ZICFMCsIMW/pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slS3TiJuEl4BK2t4DfUCCGJuiD/nOh27lF0d/wDD644=;
 b=EVprLbEDreVxS77DGRITbfJcFbXuyA4kwhuSVl4cPSUTwRDuaIXcJNN7ghTEDK51UGBgYK5s6FE04qGtSs0TwMakj0atTWKlujgBr5VI7ZfLMYgdUwfN5vIYSc4lApxmEFyNRF714qExQGrTc0hZFMxly7x+EYsSDCPEMuNkgGY07fPiOmKu1OyULIw2HtRMrg5f9bHMwhmc/lTJ/YO2a1tY0UsBPZDsCi/N+fa7RYQIiETJEu3Vx3zC83vyIawKEztnU+VOf3cd+wBuVbrQGzdS0OvcOFyxjHPrIcbUci04CIdcoLRjYvyfpy4uP/4gccuT7DymJf2EjegQoUcOkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=slS3TiJuEl4BK2t4DfUCCGJuiD/nOh27lF0d/wDD644=;
 b=n+SHadMkPROQtznYt6ydVf0MpZ+6nKQo9yZ9dPdptTEZuJbv5exOcB71U5crYnFQRlliGrozhl36TbMYRyIJQPDCWONRojTRiZupDh9F81NKK6rYfS7hz9fOjzWvWc4e3+UntQPHZY5LtPA9TMpNNbFnFkSsAEF9pFnQweLzkEk3nAWo9P73HCp2EvHXaPoOOesniWBM2T7Dmi8Az8IPkN70FCdddzaMmh+kknurSZceEy3dIzGyZBxXUEBb9SJKm/aGVxvihkZV0gvpUnUl/VnZpHmHd76fCW4YkuDvbjwXMQNwQ4QHvGhQWXujjYkZukhVcyK+2T4D4YpEuxc9TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:588::19)
 by AS1PR10MB5416.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:48d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 05:26:06 +0000
Received: from AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408]) by AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::8fe1:7e71:cf4a:7408%3]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 05:26:06 +0000
Message-ID: <a70714c8-cfc6-417d-bdd4-c42370cd8075@siemens.com>
Date: Wed, 25 Sep 2024 07:26:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: Bouncing maintainers: Xing Tong Wu, Gerd Haeussler
To: Lukas Wunner <lukas@wunner.de>,
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Baocheng Su <baocheng.su@siemens.com>,
 Felix Moessbauer <felix.moessbauer@siemens.com>,
 Christian Storm <christian.storm@siemens.com>,
 Quirin Gylstorff <quirin.gylstorff@siemens.com>,
 Chao Zeng <chao.zeng@siemens.com>
Cc: Xing Tong Wu <xingtong_wu@163.com>,
 Tobias Schaffner <tobias.schaffner@siemens.com>, linux-leds@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-watchdog@vger.kernel.org,
 helpdesk@kernel.org
References: <20240924-straight-rigorous-earthworm-f8f242@lemur>
 <ZvMaQcTHXaUDBO3U@wunner.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Content-Language: en-US
Autocrypt: addr=jan.kiszka@siemens.com; keydata=
 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
In-Reply-To: <ZvMaQcTHXaUDBO3U@wunner.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::8) To AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:588::19)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR10MB6181:EE_|AS1PR10MB5416:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c817f1a-cc9d-4f3a-1a95-08dcdd228dff
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NUt4OXJoOGV0bU0rNGxZZjVsT1pwZE4zNVE0VUFsaE02aEFYVko0ejg1MU1u?=
 =?utf-8?B?SEt4ekdweGUzbTBKdXVKdHU0UFNLdEc5OGFFa3ZPelVwSXF4dUxTNzYxdFlG?=
 =?utf-8?B?VTU5aGhrOU1lVmlHaU5jdDkwcXpndkhlK01sS2hDTm1LWUZmYm9hSEZ1ajN4?=
 =?utf-8?B?d29IUTBLRXZjMGtRTFhYb3ZocTRWT0p3V29pdlBuSDlTWktQUEw4cFlsRkhz?=
 =?utf-8?B?dEQrSTBWSXhObnJ2eGhta0c0QzF0bm5KL05GeDFkNzJhVmEwelZyclVvci9N?=
 =?utf-8?B?OTYxOEkxd3NNOHlCNHRCUHU0QjdIYnF4d0xDekplK1NXM2dJZDNiUzRnUkQ0?=
 =?utf-8?B?TW9mYURxMHFBMm51aitKaUtUOXM0Ty9CUEVUa1l0aFZjWEkweFRacXoyUWJl?=
 =?utf-8?B?QlI0REdKT1QyT3lqR3o0M05oWXVqN0VHSHU2Q0tlN0t2SHRyR3cxM0pwZ3pq?=
 =?utf-8?B?WU1JQkhSdlRRY2VpQlUrYkt0blJqdFBRZHIzNkNnTjhKWWpXUllER0p4c0FX?=
 =?utf-8?B?YkVsbjJsQkRGSFkrL01Ga3ZWSmluekQ2UlJuS1NFWVZ4V1dEOTVBaVp0MDFw?=
 =?utf-8?B?U01ndHdkQUZ4Ky94amxpTXZmVW0vajNDWVlkNm1JeXRCb2RyUHk0WEwydkZ3?=
 =?utf-8?B?WEZyZUwzYWNMOVJPWnlJSmJMQmhwcnZIRk1UcWxHaysrbndHd3Z3N21mS2ht?=
 =?utf-8?B?NWsybmRvYm9JOStySTZUSWxnSjBmcExLZTBHd1NnME5PK09SWFRpMlR3UW1W?=
 =?utf-8?B?U0JhOUpsTzRXWS95MXBKZHl6SUxObnoxKzBwdFhmLzd3YXF0Mzh5bExVaHI5?=
 =?utf-8?B?L09LcWxxclg4UWJhRStXcjhmS0ZYUHROU3pwZjUrVGpaVHB2cFNzWVdtc256?=
 =?utf-8?B?dFBETmpoekc3em1GcDR5MlpYTS91MFJqL0tpdG9YT2NSYVhpbkxnT1FMVkRO?=
 =?utf-8?B?ZTVqV2NVT0o1a3d5dFlhL2l0bHRKZGE5U2xVRC82OFZJWWRpWGdpc0pvemNC?=
 =?utf-8?B?TFVDdU5qNk5zZE8vU00vKzU2WjFBeXB6VFdzQTNnTWVnb3NmSW9XY09xMlQ3?=
 =?utf-8?B?OXE5SVV2MGNUakhjV29LNDQrU2FkTWx6UUNWc2h3NnRjYXAzb3k4Uks0RDlY?=
 =?utf-8?B?bnFTTFFGdTdQRm1udVVJSFFRQ0dmeU1CNVFrbU1hc2pZOXF1cVphQlBaSXR0?=
 =?utf-8?B?cytBeUpKSjUvZzlXakROYmVrNy82RjkrUHdLL3FMMmFIYWlkMUFRdXJmN1Rl?=
 =?utf-8?B?ckN5ZXE3b0JxUEhqd3NLRTBZRmV1aFQzNEJ1czFyUjVNdG9STUdDeEcyQW0x?=
 =?utf-8?B?SFRYclc4eExhc0xVeEdKcUE1NWU5Z1dXU2dpL0NsTGhZYzMrQUhrcDVubERN?=
 =?utf-8?B?NDMyaFM3VXkwWkJKU056RFYyYlZQaHdDRUpWN0xJcjBIL3FKUmdXaGlzVitW?=
 =?utf-8?B?Q0l2ald2MUVpR3p1WEh0M3JaUHdUZHJtUUlXM0x5ZkJWUDROb0N6cm93ZXUr?=
 =?utf-8?B?Z0NUNmhONzJ4UU1rcURqdm5vUURvVTU2MkNQaUliSFJJQWxUNkFIRGRKMUZm?=
 =?utf-8?B?ZmM5eis3QW10cEtPaEFFOTdEYUVRQWEvU2VQZ2kzajc2VEM2emc4NVFuWFZY?=
 =?utf-8?B?MDVsS2U5SjFSZlpTb1MrdFkxOUNTUGRENytZaVFNK0VpaS80ZGl0NmlZQk0w?=
 =?utf-8?B?cDVKY0dUM1RSalJDUU5adE5vSEowRy9QZWFOK3hsalRwelZ0TE1OazR1TGdv?=
 =?utf-8?B?VmRCcHdNNTl6SHZxdlRSZWVYL1J5UDNWWXUydkRkZVRVbFBOT1lCZW9oL0ZW?=
 =?utf-8?B?aFpiRnRTcU04SDFqR0lpQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1UwdnhiTWRtZDB1anRScnorQkxHL3RtNmQwM2JtckNFM3Ivaml1QWF3bDFU?=
 =?utf-8?B?WkwraXdsWXJpOVJHWGdCcklvQWtrZDl6cHF0alFPa1BVOFFVbmZJREZueW1N?=
 =?utf-8?B?WEp0WnU1VFJOZzlDeTNVM2I0ZWkvYjZGNnRpY3VUazNUai9icDNRbWNKT2tL?=
 =?utf-8?B?UVViam8zcDNEdlNZQ1dRdkdyY1J4VCs0ZXVvTU1tNzgwSkV6alVIZFN3U3ZU?=
 =?utf-8?B?emZsYjZXRlQycVBlM3lDQTJ4M3ZXdlNuYnRpQzhrNG43UkZkc3MwV01TSEx5?=
 =?utf-8?B?Y3p0OEZZSDVIeml6NkE5c2JDVC9aSkI5eGIwTjFEUGVMZ3NHNTJUTVFqRWlH?=
 =?utf-8?B?cGxlb05lZ1E1L2NCd3pZVFZGMWQ1azdqS1ZJbEh3WlNHT3p5Wk1kejJmRzVp?=
 =?utf-8?B?U1BFVmh1RE9HWDBWdUwzTllHNlY0NVo5aEwyRVlVUk5iTGsrQXlvSFlqQ2ox?=
 =?utf-8?B?ait2UnlHK3FNdGtjb2U4VHNJWVBZWTVZMVRkYktGeG56NUVxVjhuR1E3c3ZB?=
 =?utf-8?B?R1p1UHk1OGF0NHU4NlR4ZkUrWm1CYW5TTDFBSjVQTnRhWXo0SnFjRVJPYmoz?=
 =?utf-8?B?SEFqZ0hHRy85MW1BVkhWdFpYVDNTT0JRRDFiMkxwMjBhdGRMYlcvblIxVkcz?=
 =?utf-8?B?c2FCcnpjb0lDaWgvcXlWNk5ZYzBOR0E1NjZtdFF3Vit3T0ZsenNYSjRBd0Zj?=
 =?utf-8?B?cnpjZmtpNzQvYVdIYjdqRnNzcUJYSlc0ZSs2ZThZZCtzMXpabTV6Z1Zta0l2?=
 =?utf-8?B?RExMTkRqWlUvZE1xSVVKU0NoTEgvWjdVdnA4bGJKdlhCVWRwTkpFalVURFM0?=
 =?utf-8?B?d3VSc01WMGpwMi8vQjJ2R3V5NnpOSkd1SUZhcUdUbzlEMmNocGlJbUx0TmxB?=
 =?utf-8?B?L3c3OFM4TFpDMzFSOEFFWjMyeUZJQlVNNzlLWGR6eW5JOHNWRkR0dEZTTTJ0?=
 =?utf-8?B?dm1udnM5STdRSzlPYlErUjd5UlZqdmlNRHRWTFEyK3hEd1ZLOElZQzZFZFRq?=
 =?utf-8?B?SENHQk1rUmtKYWFlSGNsZWl1eTVaTGVFbkh6c3F6U0orckVxSDRpZVFjM0I4?=
 =?utf-8?B?TFFxMHM3N1BhV0ZUSXVxVXF5NnFSTDBoWHZYM1E2dlg2WUhsaG1ITWxOVjl0?=
 =?utf-8?B?dnRIeUFpMC9KcmduQktKSkhyZ2Zmc016S0hHUk15a3V3TEpTajUxRExrUlJq?=
 =?utf-8?B?KzIydVdnRS9ZQTRITGZQZ3dWcldEdnl5R0RlN21Ub095elU1SFZiNnRadGlU?=
 =?utf-8?B?dkVXWXNTQzZOdHorOVZhS3NvRW51dk5ZenFOcWRUUkJkWlY0MWJsZVlIWnFL?=
 =?utf-8?B?WGh0VTZNQ0Y1cTVLYi9VamMyTG9OR0poUnJQM3VvRDhURUloanhpN2V3dFFj?=
 =?utf-8?B?cHpBNGtvdllMQ254MkxZRVQxMTc3R3NBRnJEeDNQeHU3UFZsMWViN3d6Tjd5?=
 =?utf-8?B?dmdTZTNSOUZWdmYvL0w2N1U1d3JLQUliY203bWtnM1ZXTWd0MXNJdEgwL2NW?=
 =?utf-8?B?N0c3ZkJ3eW1OeVpMZE15NDZteHU2OVlaejdKS2F4OVJMS294T1ZDL0xVSWoz?=
 =?utf-8?B?VGdVOUZWWUtXZ3RRS2RObzdDYUZZaDNOOU8wa1hVZ2djSjM0Vm5aUTB1MkxZ?=
 =?utf-8?B?QlFLazFLNmpNZjU0Yk1RcldRdXJ5aVk0S09PNHB4WWh2L2Z4UUJGazh2V09O?=
 =?utf-8?B?WGdCVEFUbE1lWTNMb3ovZEhGSXk1SkVJQmVsTTdBN2VOdWdna0svUTd2d2ox?=
 =?utf-8?B?VDEzWFhRMFRUakk0cjFya3hLMDVzSkZySnA0M3l4SStHakVYQ3R6alFKYkZh?=
 =?utf-8?B?eUxOL3J1QVR3UUFTTHdyaVBhNFM1N1AyMlVNYmZuMnpyT0pONGNhU3pkdzhS?=
 =?utf-8?B?UjhUcDlQb3E5VG1yampPdDVnYVZ5OTgwQmxrK3NWazZCRnJjVzd5YVl2aGxO?=
 =?utf-8?B?YkhnYU9KV3NnZVRrbDlhZjNtbDgzSkkzaHhpd1ZKL3lva2RENE1PR1hWNWhN?=
 =?utf-8?B?eVkzZkdPYldvQXBEcUdFenB0L1lYWlhLZmp1b1IyM0RFdzRGVWJjb3JRMFQ2?=
 =?utf-8?B?SXZBSjJIVDZPZWxUclE3aU16TUpGNFNxNEtab1RUL3NuZlN6ZjNJSnJRT2Mz?=
 =?utf-8?Q?AnCl+GeR/ynw0P9FfK6xhDfLo?=
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c817f1a-cc9d-4f3a-1a95-08dcdd228dff
X-MS-Exchange-CrossTenant-AuthSource: AS4PR10MB6181.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 05:26:06.2183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnbiQnyL8Qv4bQxr3UxgVt4AXyRz8DErxCFHvcGUpIb63saB/OSbfIuzpnfFhsVgET4beP9HifLFF0OvrVakyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5416

Hi all,

On 24.09.24 22:00, Lukas Wunner wrote:
> [to += Jan Kiszka and other Siemens folks]
> 
> On Tue, Sep 24, 2024 at 10:56:12AM -0400, Konstantin Ryabitsev wrote:
>> Hello:
>>
>> I'm reaching out to co-maintainers of the following subsystems:
>>
>>   - SIEMENS IPC LED DRIVERS
>>   - SIEMENS IPC PLATFORM DRIVERS
>>   - SIEMENS IPC WATCHDOG DRIVERS
>>
>> The email address for several of your maintainers are bouncing:
>>
>>   M: Xing Tong Wu <xingtong.wu@siemens.com>
>>   M: Gerd Haeussler <gerd.haeussler.ext@siemens.com>
>>
>> There are several possible courses of action:
>>
>> 1. If you know the new email address for the maintainers, please ask them to
>>    submit a patch for MAINTAINERS and .mailmap files.
>>
>> 2. If these maintainer stepped away from their duties, or if co-maintainers are
>>    equally unable to reach them via any other means, please submit a patch to
>>    MAINTAINERS to remove their M: entries.
>>
>> The goal is to have no bouncing M: entries in the maintainers file, so please
>> follow up as soon as you have decided on the correct course of action.
>>
>> Best regards,
>> -- 
>> Konstantin Ryabitsev
>> Linux Foundation
>>
>> bugspray track

Sorry for the mess, we are sorting this out right now. Update patch will
follow then.

Jan

-- 
Siemens AG, Technology
Linux Expert Center



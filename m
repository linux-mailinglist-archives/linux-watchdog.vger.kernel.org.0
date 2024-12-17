Return-Path: <linux-watchdog+bounces-2586-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA7F9F4072
	for <lists+linux-watchdog@lfdr.de>; Tue, 17 Dec 2024 03:15:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44484161A0E
	for <lists+linux-watchdog@lfdr.de>; Tue, 17 Dec 2024 02:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE77F9FE;
	Tue, 17 Dec 2024 02:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="Y/sl1u0S"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2131.outbound.protection.outlook.com [40.107.255.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED85B3A1BA;
	Tue, 17 Dec 2024 02:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734401738; cv=fail; b=dTuQQ5q7EAruA+OSGxNjfGzR77uALJICFC2/Hedudp3Z16Q4oX3SN3nioey00FsVxn6C7RfvQKPWhSjC7xJJvL4l3IyWPEJFHpNeJ1pLT2W+L+AV3h5+h94MdXqTgNIcry+tKAmY0/oUWLkdukUMaLc9vdpp4e4mIP3GGWhj6cY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734401738; c=relaxed/simple;
	bh=P3bSQWGvyHK2h/d91JlfOa8mz0i2Oaitv4Zoq1PK2lM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OKsWytSHSp1EA+vPxuXh8PFO/3/U9HB8cnQJB1ygjEiIRlR0yRR4+UpZ7/dhq2Rp+4rySB7qgt7zUhGDCjeA7vqUPoXTgxpdwoXQMb7ILOZpPPQ9EmhTW5KI3OPVP6/+a8fiTvXiQKscbP3I7YgtA5sZIW9ViiSoOpNpoz7rSng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; arc=fail smtp.client-ip=40.107.255.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hb9FcWU43E8jUl5jWR0fGQsaQBDDoaNKDUf8QRlddP52w2KK75qTPsK1TqbpB5IzGufrH8hyK75aBmrzt2lj6oqmGb8JcM+GJRGgC6CodzvU4b6TyuOe0cf+Wx3eK0TqpbxOWHVh5XV0cs0ZdCLD/LU6sT6o6pZKWVlXRK58ihjU3u54yD4qryAn1x9HuXnsnRM4vJTstNOQZN9AazEaXbm3e5tnntYzTLcIT7pgPd+GIx1MuPBPW0eSECaJ4QxUV/CjY5QIxFY4ybtz5X8c5NIY+FIXdVE9ZgZIAVNjIRXfj56Kq/NroRezppH6UJoSUtn2tpLfz1d92S2Zr1219A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P3bSQWGvyHK2h/d91JlfOa8mz0i2Oaitv4Zoq1PK2lM=;
 b=e/3UPB78CE7TuHnHUyCYFCof68dlNL1er5RYtyRoSETPeCVrbTDcTJUdaW/+GCUy43q55LQH+Q2DSdO/dchgKsHMNOKp6wTwoE52HaMT9+q4GoDiNEz7ec+o/pCweXdJrYSGrXuW8aFfB71rZLy2V4WkMgiU1nV2JyAZTbQiJSUY/xD9ZxniywRPF7kD3EAGxaFPvb3JFnaqC9JLnhh7806fdho3T3umJLCnCDPazWfBK93YV7J8LHhf6wGWFL8P143jQuYmpgXg715QcCp+XRSeDNDzLkXEeOBqMkPEKUBXJPvV3AcPPol/zlR+YG5QdaQ50XF7PlRRfPXfjYOW8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P3bSQWGvyHK2h/d91JlfOa8mz0i2Oaitv4Zoq1PK2lM=;
 b=Y/sl1u0SlGOJViwSbQStOk+iUxUvTRBxNjj6mZntD6r9zefR71D3T66G2qWhHlBm6LCZKFHhNP6j+UNhNnhBHglaHheyoyEw110L7BLuU9xoX9azg5ZmiLYTjZAblY8zZVifmQxWG9DZjmARyODTqpgwOGGujsz/QA+/vPkVE2JBTSsFwnP6V54B8a6OmuLGie0wKxgTbmYac759Cbm+yPE7W8dK3PR4Ju1306Io4AzHpDKE5tl3F9MBEYBMsjedp2j/jG0ZvMRki9mSXZW20gY++ibGdUTWXymTzJwFbl5iOaILxZTUzE/0nPNthLMPAHltOpKHSqSlWqJ5aouPzg==
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com (2603:1096:400:1f9::9)
 by TYZPR06MB5074.apcprd06.prod.outlook.com (2603:1096:400:1c6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.11; Tue, 17 Dec
 2024 02:15:19 +0000
Received: from TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b]) by TYZPR06MB5203.apcprd06.prod.outlook.com
 ([fe80::b7e4:5d25:213:ef9b%4]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 02:15:18 +0000
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Guenter Roeck
	<linux@roeck-us.net>, Patrick Williams <patrick@stwcx.xyz>,
	"wim@linux-watchdog.org" <wim@linux-watchdog.org>
CC: "joel@jms.id.au" <joel@jms.id.au>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>, "Peter.Yin@quantatw.com"
	<Peter.Yin@quantatw.com>, "Patrick_NC_Lin@wiwynn.com"
	<Patrick_NC_Lin@wiwynn.com>, "Bonnie_Lo@wiwynn.com" <Bonnie_Lo@wiwynn.com>,
	"DELPHINE_CHIU@wiwynn.com" <DELPHINE_CHIU@wiwynn.com>, BMC-SW
	<BMC-SW@aspeedtech.com>, "chnguyen@amperecomputing.com"
	<chnguyen@amperecomputing.com>
Subject: RE: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
Thread-Topic: [PATCH v4 1/3] watchdog: aspeed: Update bootstatus handling
Thread-Index:
 AQHbLFdFSiy5MyUwCUe0YBcXjsWUGrKivQQAgAOD0oCABQ7T0IABNwoAgABcoTCAAJM4gIAPnzaggACImACAACRWgIAAKRmAgAHMCwCAKj+80A==
Date: Tue, 17 Dec 2024 02:15:18 +0000
Message-ID:
 <TYZPR06MB52039AB24714A400FF266024B2042@TYZPR06MB5203.apcprd06.prod.outlook.com>
References: <20241101121201.2464091-1-chin-ting_kuo@aspeedtech.com>
	 <20241101121201.2464091-2-chin-ting_kuo@aspeedtech.com>
	 <ZyUcIIb1dtoNhX00@heinlein.vulture-banana.ts.net>
	 <a0faca9a6ec7f4acdfa2f29b4ffb94b5392aea6b.camel@codeconstruct.com.au>
	 <TYZPR06MB5203053A004676F51322DECFB25C2@TYZPR06MB5203.apcprd06.prod.outlook.com>
	 <ed77d57facaaef0be796b4c6a742dc7bf3bff479.camel@codeconstruct.com.au>
	 <TYZPR06MB52039B02B6D3053355F30489B25D2@TYZPR06MB5203.apcprd06.prod.outlook.com>
	 <9a1e64ef-81d9-48b0-b871-ce4ff792eae4@roeck-us.net>
	 <TYZPR06MB52039DB39B62E6FA5220103AB2272@TYZPR06MB5203.apcprd06.prod.outlook.com>
	 <2531f830-6a36-4bd5-ba1e-9e19f0f66496@roeck-us.net>
	 <219607ab74764f3d47659fb5ab3223b3034152e5.camel@codeconstruct.com.au>
	 <9565c496-44d8-4214-8038-931926210d0f@roeck-us.net>
 <1bc83ee73545f9aab6e0a931cda8f5ffe41cb445.camel@codeconstruct.com.au>
In-Reply-To:
 <1bc83ee73545f9aab6e0a931cda8f5ffe41cb445.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB5203:EE_|TYZPR06MB5074:EE_
x-ms-office365-filtering-correlation-id: 60e51951-68e4-46e6-16ee-08dd1e40a732
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cHB2Z3V4d1Y4UExVOXMxTlYyY1ZEUCt0NklOM3A4ZTg1R0lneG9GUS9WakZG?=
 =?utf-8?B?djNFcjNuRjJjODBSOThXVkhCQk1Pa2xpNFBsVW9oVlR0K2h1dDZiclhycWpW?=
 =?utf-8?B?YlMzYUtuVm5SajE1YVYwazBIRStzclh1MjQvbWxLMmNtMFprWGNxYXMvRUlP?=
 =?utf-8?B?NDBmVHpndG44TDZ6cmo1SlJTcVEzSHUycEJtUGRVaTBkMjVicUFUdWVRenZt?=
 =?utf-8?B?Y3dZT3hGSmt4TXZLMjhCUTlkUkVLNG53SkErN2FrZEtWZ1drS1I4eGR4aHhi?=
 =?utf-8?B?eTYzMGMvOW92OENQUWcrYzdPQWx5REhTR2NVM1B4WU5lemhUaFFJYXVGYlUw?=
 =?utf-8?B?MjNyNGI4WG5FcURNak9sdlFwV3N0b2tiYk96V2lQME5wek5uWEtrSzEzTHA5?=
 =?utf-8?B?VS9md0xTYWhmTERkeE8wUWE0NEcrOXFZTVprRUlzWkFCbTBaQnp2Q0pTUUxz?=
 =?utf-8?B?Nm9wbTQ4MVQ5cE5VSVJxMll5MXhaL21uVEhuR3RQUmZERENrbThWeVZCWGpj?=
 =?utf-8?B?elQ2Yk5qS1B0WVp0NTFseDZpMlNHbzZDdHZuTXpZVnhzeS92dy9xQTlXYVlO?=
 =?utf-8?B?NUMyOFFCOHpobDQ2R3FFbnB0Qk9kUHE1R3Jlb1JtRUdCd1R2SHRhVjlpUm1P?=
 =?utf-8?B?Z3MyNEsycGQrWFFEeGNZZ3FVSXQ3NGI2SUJpTlJFVW1ESDBBOVBqV0lwbExn?=
 =?utf-8?B?NTMvalNlRkkrQjdzcGp0N21nZXBJMzFZd0ZKQjdtMDFBenNRSFVkVEZJV1Jq?=
 =?utf-8?B?TCtjN2ZnalA5QUk2anRKZDUrWFFrcEJ2eURxWHNyQkFweDhnQTd5ZHZmQ1BX?=
 =?utf-8?B?Q2VXQmEwWGlESjEwelBZVkFzdU9scmNlbW5tdmk3dlM1aW1Demtmd21qNVJi?=
 =?utf-8?B?NlNITmlIZFVPVXNMaFlQTTBxUEhoS1FjOU5yOUVZRFNLUWJYRzRRYjE1MjRt?=
 =?utf-8?B?WFl0OXN0eDQ1Wk91YXJFamNCSTRDblRYaEN4TzRNOGQ2amNLYUh6bTB4UkVv?=
 =?utf-8?B?ZVRpa0hDaUpORlE1L1hFKzY0NzVBdkNJbSs3OHJlRnBpUGFEeDJpMUhvT04w?=
 =?utf-8?B?V3NhOXpoMnBuV25sQ2NJNSs0QXJ5SnpVZThpem1Ub2h0RjBBdUN2aThsQUNL?=
 =?utf-8?B?b3d6RDU2RWxiOFRhczlDTFZKQVN3UUliZFZXT2pNdGl2SHBXcmltTU1URlpK?=
 =?utf-8?B?emxTcDMraTI4ak96Y0ptcE1KVW95dUFoQVdSaDk1bkpKNC9lamVTR2xVdmV5?=
 =?utf-8?B?S1V0SU4vSXE3bEtTZVRaSnNvOE1MdGNQV2FKYVFvRFU3V0pZMitpNDNuSXRE?=
 =?utf-8?B?NXFwSU1lb1cvQk5EWnJ4enZ6RTVPUlRWYjhPVnh3bXUvTjFJbXlXWThKUFll?=
 =?utf-8?B?K3lmdXY2SW81SFpDWXpEbm0rR29xYnYydlVPRlpwODlSNTJnWEFLajU3RmZF?=
 =?utf-8?B?NVdaTjZJRnNvUjFiZVJ0OHBiUUQ4UTdEcU9kOGVqd3JSdzlSOUlCa0lKTDJK?=
 =?utf-8?B?OUh5YjVabGVjNTUwRTFSbTh6aFFLVGoxWXE2Vmh5SjJBYXFLK0docm9sOHhO?=
 =?utf-8?B?WldUWkJxRUhHNkhRdzRyT1ZCRGxRc1BEOFBYVkZiWGh5NEl3ODd5eFdWVDhF?=
 =?utf-8?B?RWViaFNxNnFLN0E5Mng0YUdpOXJVdnpxOVhCdFpHcFRvU1dDV3RkUENhQXI1?=
 =?utf-8?B?TWJDendqd3E5VGYxZ29GY3owRDBqRDlpMmovcENjYlhQQTVtNW9OTFJqdkFq?=
 =?utf-8?B?aHJ1Rm1nU1lmaysvZi9peU9DZlJWWjdxLzBma3VpSE1ZMDZnM0l1SFBhbCtH?=
 =?utf-8?B?UEhGYUNDT05ESkMxTmpTQzR6QlRtK0diUDZTVUN1cHFLM2lrQjFvSUZOa2FE?=
 =?utf-8?B?WHVzSWtwZENGTVovUko5OVBpYjEzWktnMjYrN3diWlpRcjZwNTJsZ3dNVGhD?=
 =?utf-8?Q?NdTpj+NB3TpER3lKffJtI33zBucPqM0U?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB5203.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cnhLaGY1dkpRak9udXF4N2dwTTFiUlR6U0UzUTVhU2hTQXBOaVBBMSsyWlh1?=
 =?utf-8?B?VG1qUkkxSGVNS3pFbFpLUmtiSjZuWlRlOU5aVHhzZGwrUjlQQVArTXhjOTky?=
 =?utf-8?B?WFZac3hibjNtWnpjSE9VNlJUbjdLdmRBYzltTWd5QnFZUUtiTzFGd08xaFVp?=
 =?utf-8?B?KzhNNlIvdlBpSVc3YnNlOENsMnFqbUUyZTNnbjUzeHhLTGx6WU9oQ25xTFFk?=
 =?utf-8?B?Sk1KSGRNSmMrdW11NXVKNmVqUkpYWDYxL2FLMGRLRlBKRUIrY3VLRTBUTmV3?=
 =?utf-8?B?RG1KUSt0VlI3dmpqekJ1SHd3RGhBNjhtZ1ZYZFhxWEdSeUI5Mk9EblZiOWJP?=
 =?utf-8?B?WDRvaEFha2paU1pBUDNJOTBMSFQwdjMranB2aForejhleXJSN3cxQWlLZFkz?=
 =?utf-8?B?RTFtWCtteThrVWNrUk50YjV5WmFYZlZQSFlQZGkzN1p0a3lKOGJIOWRLMVgv?=
 =?utf-8?B?ZDFwOHpFRHlQa2xSMEJldXFnOStaYzJoQ2tlTDVyL3VtMlpTd2ZYaHdpWDFD?=
 =?utf-8?B?cGRGQ3Mxc25PbTMzRHRpNm1IVkNER2VCaFVaaENzQ0ExSGJKZWxMR1RESXE2?=
 =?utf-8?B?eUxPZWFwSEhlalg5WVdKcktnSVp1RUNBSWNWK0NkdGNBRmFoR3hpYzhjWlBB?=
 =?utf-8?B?QzI0UllMTm9BUTVnaHByY2IyRUhUcVRvNkE3bi9PRzR3SldBZGZDcituRU9T?=
 =?utf-8?B?cm9ycllWMU93VDNZYkJRN1dSQmxPemErdy94V3hRZlUrZUJ5Z1dNNXZIUHZh?=
 =?utf-8?B?MnJWQTBxSW1lUXVRMmdiQWtjaktneFpVbGNFVXRITlQ5OTAzZkNzQW44U1Ix?=
 =?utf-8?B?NStwSmpxTGdhRytHT1V6VThIY1o3L3Nzb0MrNHFwRzBxU1hDVmREMVJWNW90?=
 =?utf-8?B?Kzd2aHBXM0E1czhVMHVOZGN3aGJQejN1M0VGendhZzk4Y0FncDNGTDZIM1V4?=
 =?utf-8?B?SzM1Ni9HdlAvYU9WTG0zU3ZOVS9PWk9JVi9BYnpIekk4MkpWdmd1aFpOdjJr?=
 =?utf-8?B?OXgrMEZSdWwxVkdIME5xODBKdlZ6Rjk3eCs0THFIRjJJSFA5M01QVi92a2dZ?=
 =?utf-8?B?ZFVnNlFpcGd6RW9oaHRZaXgyNTQ5TktSZjVraEpzc3F0cHJqS2p4aCtnWGVB?=
 =?utf-8?B?bHViQ0ltNFJNUWVzWlBqS1BIMWl5K0MyTVlnK3FjVllKaktCakdvMjIxNSt3?=
 =?utf-8?B?cDQ5MEovaFpMdE4wbUpwbHFHVnBtSHFZTnI1OFAvOFFJMTlvVzI0enhWN1B2?=
 =?utf-8?B?aUdmRktwRnN1dmJDSEpyei9LeHFpc1BNNWMzc1RMd1VZTEJVSGd4aUkxVXlU?=
 =?utf-8?B?SUNoZHROaHJJa05jNFpJd2VYeTJxdS9PTHBOSkw2Y3p2a3FlK0p2cnVUc2ZF?=
 =?utf-8?B?T0RGSmZIUW5qSDVqWFdWRlg4YXFmb1hUcmtpYW5lTjhTYXVKRXMyY1Y0Y0pU?=
 =?utf-8?B?ZW1HV0VralFXNWxmL29PTHE2cExlOTBaTTVoU0d0L2tza2h1MWtidk5sZnpY?=
 =?utf-8?B?L2d4UjZSLzg5Zm5hR0wwUFNlallaYjJ1NmlBSDFSWVlOK3RHbjJpajNmdW44?=
 =?utf-8?B?QzUrVW45ZGpHeG55VS9LZ3NIa2wrb0ZzSGkxTXZPUUxPQTNHVHFHeVlPSHZH?=
 =?utf-8?B?dXRjQWtkRFNKaGtvS1dIS3g1ZmRRdTE2ODZJeWZZSytpN3BZNmNyUmZlbmFn?=
 =?utf-8?B?S29CV3VQR2h1MUNGK2hUNDRqQStYS2lLL25DMkQrWmNtTjRRUTlCbjZUWmN1?=
 =?utf-8?B?V2x3dXgvMC9SMWJzSFlWaEZQYjV5dDZYQzN4aUlaa2J2WXZ6Unlwa2QzRkYz?=
 =?utf-8?B?aDZzRkxrOVh4cHFVU0NFTGJ5bFJMalV3UDBjVm5hVEk5c3JaZFdkdmFQei9m?=
 =?utf-8?B?VVFxUTZoeWVwYi8zOGpDMko5NnRpWm03T21laVIzbU1VQmpJV0FTYzVPbzBV?=
 =?utf-8?B?aDlGTklRZHFLd0ZtLzQ4L0hwdGRDUEd5eEV4bDV1a3NaRHpldWdtTTVRZlVC?=
 =?utf-8?B?WDVKRmtyK1pVa21oUG50QlV6aU1YRWRrdjRmaEpMc2FxV2dIOWxOVzNoTE1q?=
 =?utf-8?B?K3AyQWM1WmFpSHBkTDJ0OTJRK3VjSEZjSW5xc1NJZi96ODJ1UTVLWHQ3cTJZ?=
 =?utf-8?B?Ni9CV3ZwRjNnRHdoT2pkK2gyNk91ZkxvL21laUhlQTRCTm1NcHNSQURjQitk?=
 =?utf-8?B?dFE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e51951-68e4-46e6-16ee-08dd1e40a732
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2024 02:15:18.7850
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oflbXlk1/u8jXRgRK+oyzYjtsnNzFwjBqUzOc7cjtZffh5Ofr1a1uuWVYf4hHg5T0zCyGOq5D/9Ah4Wd/uTUv12GAm+zJhqlln+77JB0mjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5074

SGkgQW5kcmV3LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZHJl
dyBKZWZmZXJ5IDxhbmRyZXdAY29kZWNvbnN0cnVjdC5jb20uYXU+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgTm92ZW1iZXIgMjAsIDIwMjQgMTI6NTQgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAx
LzNdIHdhdGNoZG9nOiBhc3BlZWQ6IFVwZGF0ZSBib290c3RhdHVzIGhhbmRsaW5nDQo+IA0KPiBP
biBNb24sIDIwMjQtMTEtMTggYXQgMTc6MjcgLTA4MDAsIEd1ZW50ZXIgUm9lY2sgd3JvdGU6DQo+
ID4gU28sIGFnYWluLCB3aGF0IGV4YWN0bHkgd291bGQgdXNlcnNwYWNlIGRvIHdpdGggdGhlIGlu
Zm9ybWF0aW9uIHRoYXQNCj4gPiB0aGlzIHdhcyBhIHdhdGNoZG9nIHRyaWdnZXJlZCB3YXJtIHJl
Ym9vdCA/IFdoeSB3b3VsZCBpdCBuZWVkIHRoYXQNCj4gPiBpbmZvcm1hdGlvbiA/DQo+IA0KPiBJ
J2xsIGRlZmVyIHRvIHRoZSBvdGhlcnMgb24gVG8vQ2MgdG8gYW5zd2VyIHRoYXQuDQo+IA0KPiBN
eSBvbmx5IHBvc2l0aW9uIGlzIEkgZG9uJ3QgdGhpbmsgY2hhbmdpbmcgYmVoYXZpb3VyIG9mIGV4
aXN0aW5nIGRyaXZlcnMgdG8NCj4gZXhwbG9pdCBXRElPRl9FWFRFUk4xIGFzIGEgZ3JhY2VmdWwt
cmVib290IGluZGljYXRvciBpcyBhIGdvb2QgaWRlYSBlaXRoZXIuDQo+IE9idmlvdXNseSBJIGRv
bid0IGhhdmUgbXVjaCBza2luIGluIHRoZSBnYW1lIHdpdGggd2F0Y2hkb2cgbWFpbnRlbmFuY2Us
IHNvDQo+IG15IHRob3VnaHRzIHNob3VsZG4ndCBoYXZlIG11Y2ggaW5mbHVlbmNlIGJleW9uZCB0
aGUgQXNwZWVkLXNwZWNpZmljcywgYnV0IEkNCj4ganVzdCBkaWRuJ3Qgd2FudCB0byBzZWUgc29t
ZSBmdW4gbmV3IGNvbmZ1c2lvbiBvciBpbmNvbXBhdGliaWxpdHkgYXJpc2UgYXMgYQ0KPiByZXN1
bHQuDQo+IA0KQWdyZWUgdG8geW91ciBtaXNnaXZpbmcsIGluIHRoZSBuZXh0IHBhdGNoZXMsIG9u
bHkgdHdvIGNhdGVnb3JpZXMsICJQb3dlciBvbiByZXNldCINCmFuZCAiV0RUIHJlc2V0IiAoQ2Fy
ZCByZXNldCksIHdpbGwgYmUgdGFrZW4gaW50byBjb25zaWRlcmF0aW9uLiBUaGUgZ3JhY2VmdWwt
cmVib290DQpzY2VuYXJpbyB3aWxsIGJlIHBvc3Rwb25lZCB0byB0aGUgcGF0Y2hlcyBpbiB0aGUg
ZnV0dXJlLg0KDQoNClRoYW5rcywNCkNoaW4tVGluZw0KDQo=


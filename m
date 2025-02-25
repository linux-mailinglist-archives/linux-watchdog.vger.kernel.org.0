Return-Path: <linux-watchdog+bounces-3004-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31663A441B1
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 15:04:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6562189DE14
	for <lists+linux-watchdog@lfdr.de>; Tue, 25 Feb 2025 13:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E017526A0F8;
	Tue, 25 Feb 2025 13:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="NF4nNhxW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0b-0016f401.pphosted.com [67.231.156.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0078C26989E;
	Tue, 25 Feb 2025 13:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.156.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740491913; cv=fail; b=YlHoIxF+lwSFR6TQnMDHSUDzFA5J6j581zkMeb35XbcAvQjA1sc9W/KHITTil2g7HuPLNcfegTvkVUvORv42AtA21gAOUbXsLTFrJcj6e8ySDxTgnDcTmGOuFmfJGtsFPCKUk3PkoZh2+ANG7FQ/updiMiJ3lZfwToclPnJWKCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740491913; c=relaxed/simple;
	bh=e+2/Eeb2xbUYYhQwiUBGQlQK+nGrDpi7oPjGJfVKDb4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jYbBXgkDlU8n/3Qo926HoACk4vqQzZkuaHe5knEtBJjss+neAvXrQwk/4GKKDweFX8xelK4mizicYdDhAZVM4BsVtAnN2hplOsZzMNdbn1U66sw1p6ATgZrf60x/nRleRJkJh0o8JEyj1DWCrQOXPpwqpX+oGgIMItRKVlsA5Zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=NF4nNhxW; arc=fail smtp.client-ip=67.231.156.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045851.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PBHFLn032088;
	Tue, 25 Feb 2025 05:58:15 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 451cuqr93e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 05:58:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NMhBqaJY1NC5diZAzp/Uk2gtIrT0A211s3r+/PyOmXGzyeDWPHTr5LySum3SLu0AbDvCkz7ymX9UJfnnk/9GQ8CQUUzL6vhcNWQuk4k2wRLYmSLqB3NcxTlQOSFUaNErVMZZ6rITaZR0ZJe7s87+0XIHmM1a6hznyEYdenkaIp910rl5enrZTVWWhArRI2/EySmh61XhQiXUJfNsM9uzjfIIo3eBZx62lYwDaODGLdxHJN8bDZcTqTJCcxIneRGV4vj6Nc9H9Csk7NjNhzRXZFymcPM/DMARSqbV8akCQfA0CLWKHWX5+GIYeYEt7SIs1A3fy/r9D3ES4+WUuy5mkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GyHB2ViqyrMTjyBeL93JtlSqgN+jpfIE8DzhFrnRwrs=;
 b=vqJQA+H+vaVbebrbcLqOiaFQWZ7kON0XByrIGM6o2dZel/LpORd9CJbknd6ku+ZslexEfsKdr2M3rINLCViqNrkKqRjjlSCTkQKInD18wlbyym8EKqNZUtoDaf7kxDKSikdTBc2yftVMB4ccUOHSyhGNDErv0Lqj/Zr54BVBdYzp36+9PpPqvaMXsgEtIdDPGh3Me3vYf184HEAPR6ye63WRU3DgNHoBQ7m14tbApW502cAx6VKI9o6moHYKIZ7S6EcVsrdLRHd+O7aCjlz4IjvF1a5zN1oV0pJRHgjrR16/bmB5/HMPVKSYhPSNevVSl3k4A1ZtjZhE/GRF6cx3ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyHB2ViqyrMTjyBeL93JtlSqgN+jpfIE8DzhFrnRwrs=;
 b=NF4nNhxWMYeQ2ITUcXfBkcsXnpY1W5IwkNDYuoI/SnbIk4/vMnHg3fsK16gOW8sT2KU/zJJqO+Hl4QfyjTX4bOBksYcKwL9+8fKlaf9mrnMXk45I2xTUM6ADolcs7RheicWxT+DQdxptkZ0vGGgTgQ0ZXPnjJ+pP/rIZM7qWz1M=
Received: from PH8PR18MB5381.namprd18.prod.outlook.com (2603:10b6:510:254::16)
 by SJ0PR18MB3865.namprd18.prod.outlook.com (2603:10b6:a03:2ea::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 13:58:12 +0000
Received: from PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a]) by PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a%6]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 13:58:12 +0000
From: George Cherian <gcherian@marvell.com>
To: Guenter Roeck <linux@roeck-us.net>,
        "wim@linux-watchdog.org"
	<wim@linux-watchdog.org>,
        "corbet@lwn.net" <corbet@lwn.net>
CC: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drivers: watchdog: Add support for panic notifier
 callback
Thread-Topic: [PATCH v2] drivers: watchdog: Add support for panic notifier
 callback
Thread-Index: AQHbh41OqBLr9kThSkCVGDutCs9L5g==
Date: Tue, 25 Feb 2025 13:58:12 +0000
Message-ID:
 <PH8PR18MB5381AE88C48A9960478D5C13C5C32@PH8PR18MB5381.namprd18.prod.outlook.com>
References: <20250225095203.2139482-1-george.cherian@marvell.com>
 <3308b190-b639-4aff-a1f8-3ad9761dd991@roeck-us.net>
In-Reply-To: <3308b190-b639-4aff-a1f8-3ad9761dd991@roeck-us.net>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR18MB5381:EE_|SJ0PR18MB3865:EE_
x-ms-office365-filtering-correlation-id: 4f5920cb-2e04-478f-724f-08dd55a47157
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?r49MqmBPQ1Znn1GZkLIZDqP3eWttbh0GI3MvZEKXKBOHcc2Rw9LfGUyBd3?=
 =?iso-8859-1?Q?Of2nwduzxP1yhtlDESp7Ra1S1NQh+HOOPnaTZAuRvHv7wi5Tzl1m4NYL6b?=
 =?iso-8859-1?Q?+HimvjlGDYOlfy6+uSYGt6u43Z9LlXvHc1p6Ipph3vZ1//5mHi3XLf4sbQ?=
 =?iso-8859-1?Q?Jvm7iQY2i4WJB8jA4awaASsFIVBmCKD/12Npt9q+XLXF73NAkTzLSaXIUJ?=
 =?iso-8859-1?Q?ymEtGIGyMEumQhCyYXm6IgYBumv9b2A3g37912Wws8ntZWQ0W+4VIyflbA?=
 =?iso-8859-1?Q?B0iUlrbJllJdrEgYG+8i5RNeKlqrc06Ix3JInsJvHsU4xIc7pPQEScx/EJ?=
 =?iso-8859-1?Q?CR8kbYwyRwxNXHxS9ibg+XVkPzWSwWoQRixy+WliyDclVtTDHnyL6+k9Xz?=
 =?iso-8859-1?Q?9yb5sravh8tbmYtqBVdNCwKvj32kbYcRIEAnsLjDioiDKb69Dt+CC0m0n1?=
 =?iso-8859-1?Q?otv0Wv/wlInEPLM8U4MQWKjdu2voIs4JM38KA9oA9rBApyAM+GepgbQRKM?=
 =?iso-8859-1?Q?dXFr/jEkSjZXTn5+/o0CaMW1dAI/mP5ZMTXt7N2XL8PNwmTVmw8v6cZyka?=
 =?iso-8859-1?Q?M3v08mj4S9yEb+Ovs2b67VbA2RbwBnmwUgHKBwHBYNunyxvbntQojptoCK?=
 =?iso-8859-1?Q?EdnEAIKpu+BBF/yu8getFjXze9ufx890YJoMm7YLVuOZB2RNMBEdWdo3sD?=
 =?iso-8859-1?Q?jIQy9/UW87V5KKfznN4pcJciMY69+MGy/hU2wLnxRJ3kBTlZuy8jBeEyfG?=
 =?iso-8859-1?Q?hVHgP3volIc9mp5UOd2KtzP8wABD8fdqC4HXWlbl3l4GI4gtS6IF99oXEn?=
 =?iso-8859-1?Q?SQe84Ix/Q4vxPItz41G6pKHbVv8ucXcjf+86ezRNg066E4F35f2zdbp8Wv?=
 =?iso-8859-1?Q?efPI9OdsE5OgGo5HscOBbu07DAfBxewJ1JJ8JEKkPGcNKqZqc6g0Mem2lB?=
 =?iso-8859-1?Q?WwhN+U1YktEnY97wzocluW5dqrO/Hk5kvXMtN+jN2aqUNoI8rMQE21WPrP?=
 =?iso-8859-1?Q?CJE8QRhLLlvcPqkgebEaNYZrrKCulTQ0fDrCMjAZ82ZP48EmYOn8BXAZml?=
 =?iso-8859-1?Q?8A2UlE6sVpBHGT3UHiY0dEelicmWrNDkX3L5syg7KHZKONGeuxmxhnD8YK?=
 =?iso-8859-1?Q?1QUIUuyDuAjj/TKBascnq0iJHk00AvpjkY0C1+eZVErvHxgUj91kByuSc2?=
 =?iso-8859-1?Q?ANqJAe9wcEdz8Wm8zozPf3RQhN76bZRZ7/2JeezNsRV0YVAc/hS6j9k+Yp?=
 =?iso-8859-1?Q?Kl+XGFphp5TTRPTA2UMU9P8Dew2U2NAWBWfmBycV2EtugryRn8Znyi0sAN?=
 =?iso-8859-1?Q?kz5dljVr70FaRCRSLGuq1qHD3HdBwlbxUwhsoaplyIQDUF2SLZKjgzMBgA?=
 =?iso-8859-1?Q?CACvD4mRiPsB6ENUZ9YQz7NwYpYGjcwTtWHbP18CaLSkDuTL1ClIFKA0he?=
 =?iso-8859-1?Q?70DKhoxvaRw9lLAwjQgprbnkZ36mHJwKOWCv0L/1854d8RaXG9WcOhJXBi?=
 =?iso-8859-1?Q?ij/BlCZe46pGWNK/oW/sh8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR18MB5381.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?kzZ3KPeqJG4mXIML0tkzDzysFa3OyUdTZuaUExj0t2+FlG1qkLi6G9yjpO?=
 =?iso-8859-1?Q?ZISKYeJ/DNm/WDFCgRVyth+CoWEpBZaX9vuhetmHqDZ4Iaw3tSFoHlqLkv?=
 =?iso-8859-1?Q?DFWHYdUbGVeWEPyCYa/FZMR7AXvnBC6Z/tUknyxVpRb+kj5vZfMtpI/qnC?=
 =?iso-8859-1?Q?FssZx+V7tiMSuTmJlG0qWdd9paB7vTnD8b1IV8nNfuKazEU9gOD57RqA1B?=
 =?iso-8859-1?Q?SK/4O9c3DiuUZUoHjSkcxcw9gEYkikwyn4Rd/0wbaZEnOmMs1k4b+/cRbR?=
 =?iso-8859-1?Q?HLIXslec6lIjpFo35QsPS4yeqDO+puAhmCA/ZmvH2+GFpZQsAs9RY1y21s?=
 =?iso-8859-1?Q?JAgYm6weEXkkv8R3TJoCxRM9SB56Q7esoB7b+LtG7N8sTvy7Sjxl8js7XS?=
 =?iso-8859-1?Q?Vifl6yzFjQkUs20z/1GCpNzAQgwIQSnq117YNgwJK9juTj/iCdxUD9AWEj?=
 =?iso-8859-1?Q?d1/TabOItRbgdDWdXni9bJXPeGjbh3GlQrmaRa9ar39kUBfbb0Y7QzplmX?=
 =?iso-8859-1?Q?gPY1cM4khZcYdqZJVTLJwVrv/T2EaXo9r7h5KRJLiHUGMF9Y6z70hXqNfL?=
 =?iso-8859-1?Q?XruZiXUxE5g0aM5gPiH5RWhPNopUYRUcDsg4uDFwxCyUlUayYy8u/KoeYJ?=
 =?iso-8859-1?Q?/baiFK6N2FP+ZUSDvDvnp71HYrZvFUQFC3WTAdR/2ESzRUxfxKWZ9ICrPr?=
 =?iso-8859-1?Q?ZJlEeYIxbKSTvdwOm2w2h39utVDHFSVoRq8Hi13P44PNGUAoYrmuBt6KNz?=
 =?iso-8859-1?Q?DQyFLbH9yR4BnMC9HYa03Ujk3oZske5+mfLym6jedx6+QdPFf/sYbK+iHq?=
 =?iso-8859-1?Q?l1gf2VLiUYAJ+8YuIWPJ9GJWYitpFQijlfsV6G8JP5jf+7StNiRyDDVE+P?=
 =?iso-8859-1?Q?l82DUonEnbC6OPRvSdKrXHHDNzAzrxkaj7uBhOrlK1zkZRyVeR8spJFspm?=
 =?iso-8859-1?Q?DFUt9altL3rSda3hEArVD9EwALH0/z720LeIfl/6qKhEXHYiZOhT1XRs4I?=
 =?iso-8859-1?Q?QObxtiqDFp87VlDejuyJlZV8WBAQc6ZqnOzP8DZ2DSthgzg/0U5JyfkNON?=
 =?iso-8859-1?Q?Bz3Ff1ugldxJtGcXg+NNRowIWdtZ1SjKPMILEdlxbk769U+zUftVkrBuw6?=
 =?iso-8859-1?Q?/MMYYw+iULhYV8BCx4IQQfA3z4gOJOj89JPWNTJOLQDzaWpmdZQe68prKV?=
 =?iso-8859-1?Q?GZPjg28qSNP+SnySwxIeJyAa3HPsXuW/Uo16W9bJWmr75fJGQiHUJGpGo5?=
 =?iso-8859-1?Q?UP18e+fxsjhX41vC44u+LJRiD22+ldCLciSfBJpLQ29l8AtPJ71/R9U3Ea?=
 =?iso-8859-1?Q?HGr8JtiwJB+XVmZLBf93hYtGvltehBUoAMTmWrhg9aQqiC0sAVUdrmcNUx?=
 =?iso-8859-1?Q?yBuY9X/q4xA6SbdMqCBp9InRVPAzfdHxsKreZ3Xv+rjmaTiTjNux6Tmprk?=
 =?iso-8859-1?Q?PdkMFHFT3hT+Hc+LQ/pwS8X7gEtKd1CzUCAvfSSdAZvmiJUlm7PmvN706B?=
 =?iso-8859-1?Q?pfGQ14fEYJSRqalDYcJcb5ERi2ZhlGIthjg/PtiH/+ZvId+ulcCD43hsdk?=
 =?iso-8859-1?Q?NCyTaGuPB0pCWfS8Rm9DWgxWEF+4bxPOSzIv9WCHLy0oudowvRzKEZKZEC?=
 =?iso-8859-1?Q?W8KJ0oCHG4wMg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR18MB5381.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f5920cb-2e04-478f-724f-08dd55a47157
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 13:58:12.0597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TXMiRG/VBzzkVCzm1CAmREqKqwa8e5o+SPxIWDyuiKCu0l8wzznDdrK8vIslco2poakbI8E7dKUENttn57dquA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR18MB3865
X-Proofpoint-GUID: oNIkSTbE7xA8hW2q562bs3X9dXTtu95v
X-Proofpoint-ORIG-GUID: oNIkSTbE7xA8hW2q562bs3X9dXTtu95v
X-Authority-Analysis: v=2.4 cv=QNuSRhLL c=1 sm=1 tr=0 ts=67bdcc77 cx=c_pps a=ZuQraZtzrhlqXEa35WAx3g==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=T2h4t0Lz3GQA:10 a=-AAbraWEqlQA:10
 a=pGLkceISAAAA:8 a=_jlGtV7tAAAA:8 a=e53pv_uEAAAA:8 a=07d9gI8wAAAA:8 a=VwQbUJbxAAAA:8 a=M5GUcnROAAAA:8 a=I_BDrkNgiz8jcAtkQmgA:9 a=wPNLvfGTeEIA:10 a=nlm17XC03S6CtCLSeiRr:22 a=i2WUat-zol0iyFTidwVo:22 a=e2CUPOnPG4QKp8I52DXD:22 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01

> From: Guenter Roeck <groeck7@gmail.com> on behalf of Guenter Roeck <linux=
@roeck-us.net>=0A=
> Sent: Tuesday, February 25, 2025 18:44=0A=
> To: George Cherian; wim@linux-watchdog.org; corbet@lwn.net=0A=
> Cc: linux-watchdog@vger.kernel.org; linux-doc@vger.kernel.org; linux-kern=
el@vger.kernel.org=0A=
> Subject: Re: [PATCH v2] drivers: watchdog: Add support for panic notifier=
 callback=0A=
>> On 2/25/25 01:52, George Cherian wrote:=0A=
>> Watchdog is not turned off in kernel panic situation.=0A=
>> In certain systems this might prevent the successful loading=0A=
>> of kdump kernel. The kdump kernel might hit a watchdog reset=0A=
>> while it is booting.=0A=
>>=0A=
>> To avoid such scenarios add a panic notifier call back function=0A=
>> which can stop the watchdog. This provision can be enabled by=0A=
>> passing watchdog.stop_on_panic=3D1 via kernel command-line parameter.=0A=
>>=0A=
>> Signed-off-by: George Cherian <george.cherian@marvell.com>=0A=
>> ---=0A=
>> Changelog:=0A=
>> v1 -> v2=0A=
>> - Remove the per driver flag setting option=0A=
>=0A=
>You didn't actually remove it.=0A=
My bad .... I didn't really remove the helper function in watchdog.h.=0A=
>=0A=
>=0A=
>> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdo=
g_core.c=0A=
>> index d46d8c8c01f2..8cbebe38b7dd 100644=0A=
>> --- a/drivers/watchdog/watchdog_core.c=0A=
>> +++ b/drivers/watchdog/watchdog_core.c=0A=
...>=0A=
>> +/* Use the following function to stop the watchdog on panic */=0A=
>> +static inline void watchdog_stop_on_panic(struct watchdog_device *wdd)=
=0A=
>> +{=0A=
>> +     set_bit(WDOG_STOP_ON_PANIC, &wdd->status);=0A=
>> +}=0A=
>=0A=
>Under what circumstance could or would a _driver_ request this ?=0A=
>I do not see the use case, sorry.=0A=
=0A=
Fixing it up right away and sending v3.=0A=
Thanks for the review.=0A=
=0A=
>Guenter=0A=
=0A=
-George=0A=
=0A=


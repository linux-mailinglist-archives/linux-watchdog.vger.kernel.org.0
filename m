Return-Path: <linux-watchdog+bounces-3016-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C0CA459BC
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Feb 2025 10:14:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3457B166748
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Feb 2025 09:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E17631E1DFA;
	Wed, 26 Feb 2025 09:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="eFlsp/Xb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1531A2C0E;
	Wed, 26 Feb 2025 09:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740561279; cv=fail; b=l6zJGm2pq3odbA713JMmTyy72KfbLa5sp/O69V898/KK8VkxEtzNRBqoJXBbEzELRU6zrnLVx+JfzbapQ9TOrDoXkwt73KKtvrXnb7ysaTer03xLz1ifbFssVF7622EUl6V1HcwI2h/T7FXgLYBq+Txo69EbWikxqkntcK5LyRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740561279; c=relaxed/simple;
	bh=woO1ZQhh4f2dE0wk65FfwGQAyC+2R68L7IjUFRHccm0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=otbhKZ5UW//S/D0/+YE5rKsN/tTZIfhmOXnVIHOo9jMU/9VpT9i/HdpOF3B/d5W31RnDmyoNIULJ1SeV7XRZWHoMon9jEdkwlZX0dxZbJqoF9zQYSIFRlDy06s1M0GDrZwCTcdh0EmD6jtm5vLKn1vul0RyzwOHR/SnTKaI4VHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=eFlsp/Xb; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q6hLFp000618;
	Wed, 26 Feb 2025 01:14:16 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 451wxfr9pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 01:14:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+o52YBIV9j1vpsmMTvmI9r5mI5GATPLj5WKv07HDLtY9+vPHxQzDljO6OZOnGLtsdwDsgjjHKDWTW+f+xDAIBsonzSWtV1bUALneDt6IZ4/SXKTNS/ib0NZIhkZ/MV9qoNSLD+gGen8wg4Z6vkOR50rHCnZh9mGK9WQxNKo+mYa/GGP4wHId/CytPnjuIZNeSnmvxb/WX1fS20x4BfSEU9HW6/BBMVBaqOPmI9jK/TWleP/l+pMzaRJ/afaZPzL9HYMyy1+n8uSMOzFdT6dc5ZrDp8pQFTI3+lLXPolGquQcDWnRBD0P22HBV0DBMnEbZqOAfMhBFcsPyp6Q2rUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XnZv4mYbpxA+R8iO8tIv+hkQxLVx61/UzlQvOqDpDI=;
 b=UPoIZQ4lFxm1ht+RXZ7zxO7+AHpaqZUfcK9U1l7MbfNUV7FdYC0dmT7Gw8YUYnvDDmALnt/9blug8XxJ20duAWZ9cdWj3k1E0ZdJL7HZi+LiWI7B9HsdnzGsohARRCai3epQzCGNOIIIP7XhCKGCm/3wZNIe9Z9JvsYnSsru86Aw424gt+AEhDLUO1qXDihf83OYDMNdeJy9Gtsi9hgOPGpNTPr/EXJBNjNk5WmrxcHiyzrLwhSQfYNp9+xKWu71emOwZu5rcjexKfoER92KzUpH8eV4BwSv6NMwX1h/5cNJZw2usLdfogho+6MkHBTQKNpIDCb6Actg1kkpvj8fQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XnZv4mYbpxA+R8iO8tIv+hkQxLVx61/UzlQvOqDpDI=;
 b=eFlsp/XbZbtumLRzonijfW6xJdO7CBklvyz+TpW/nPBS7wi/skxCPUelBjBdSgR/DFnDo/IgH5WMTxJYSaGIQXQE54lUreubk90lTz/us95DQOd+xBikBkTpRALUPepQaprl7tUS4A9lw+ihpysj6LliXkhpgetx//ux2JGCTFE=
Received: from PH8PR18MB5381.namprd18.prod.outlook.com (2603:10b6:510:254::16)
 by CO6PR18MB3793.namprd18.prod.outlook.com (2603:10b6:5:345::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Wed, 26 Feb
 2025 09:14:12 +0000
Received: from PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a]) by PH8PR18MB5381.namprd18.prod.outlook.com
 ([fe80::79aa:7ee4:516e:200a%6]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 09:14:12 +0000
From: George Cherian <gcherian@marvell.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "corbet@lwn.net"
	<corbet@lwn.net>,
        "linux-watchdog@vger.kernel.org"
	<linux-watchdog@vger.kernel.org>,
        "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [EXTERNAL] Re: [PATCH v3] drivers: watchdog: Add support for
 panic notifier callback
Thread-Topic: [EXTERNAL] Re: [PATCH v3] drivers: watchdog: Add support for
 panic notifier callback
Thread-Index: AQHbh451905NHpsDtky/aDDNxvDkU7NYLtsAgAEd4mQ=
Date: Wed, 26 Feb 2025 09:14:11 +0000
Message-ID:
 <PH8PR18MB53811DA4CD7BAAFE7C8857CBC5C22@PH8PR18MB5381.namprd18.prod.outlook.com>
References: <20250225140615.2141119-1-george.cherian@marvell.com>
 <85d99af3-a3ee-41dc-96df-0b9903a6f516@roeck-us.net>
In-Reply-To: <85d99af3-a3ee-41dc-96df-0b9903a6f516@roeck-us.net>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR18MB5381:EE_|CO6PR18MB3793:EE_
x-ms-office365-filtering-correlation-id: 67bc2b07-c373-4cff-e767-08dd5645ef0a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?AoPK+MQSQrAb/AquUlMIRlNo0JF7suoiWj6D2WawUcR1loCqAsZ80+Nq21?=
 =?iso-8859-1?Q?VE4/Mm9DwfGLs4nQTnP0Vf2Al6hnM8m8surp0HZad3YY4n/AYB7dXQGkmU?=
 =?iso-8859-1?Q?bobkU2iwD0KSeLQrj/hbTBrdA/LmgoGygFdVESrnsKGa8OTBZTOMcYaGhO?=
 =?iso-8859-1?Q?6lTENSwLLQMCBpXUPOmu5UnVaRKhLodTkrNx6OD/QH1bgIIlJm8J4ay1ms?=
 =?iso-8859-1?Q?kaUV4lRkrOd23HqfEfqaYcWyBOisO7mUH1XJEVZ0Rb8dj8azosRNlO6Smq?=
 =?iso-8859-1?Q?4s05/WWhTEFtkMIQOqQ2SvQFZX/DPeJUuSKmP8HWP6GQbq62F+pagTKCau?=
 =?iso-8859-1?Q?6c5vJX1lff2Aa3VkTTy/Tog6LVAVo5ziXFXambWDucFhzXLcWKei7QLc4L?=
 =?iso-8859-1?Q?T811vDukL9DRSJJIkwDrJ/ZndLLzLkBCtxGwijj+RWhX9FOdcyvXgCvgQM?=
 =?iso-8859-1?Q?E2vMDfJnBOiJ1jWS1gxfsyedv+aFjkPEbj1uu2d7Dv2M60M363dHjAArnI?=
 =?iso-8859-1?Q?jWhWsBpeMKx4LNR6FsLlAWA30IRkme9DjPAGFQW9GtzFv7SyTsTp+u0lDq?=
 =?iso-8859-1?Q?AD8tn/9yBEb6XnmVchEobUo3LLc1OM0eTe4TwIkBSQvHbecspzijOVJeqE?=
 =?iso-8859-1?Q?jxRFIjzKL47WIk/YXW0CRzTvYacdIwYavMFrM3bfghcsh3OfVjXrPBTxmq?=
 =?iso-8859-1?Q?PyzbkdiearZv9DW6EfhFoaMGAwyN+jiEAWDNyOYc3dj6+O+w9aipgbVrY+?=
 =?iso-8859-1?Q?k6H/Nxv8xf+XeAw03rQ7AS5qbPdp8+DBDe5rFuKK3XzQXNe4ghWoci1zNL?=
 =?iso-8859-1?Q?EZXohkjQylY+axWR5+h+0YVA517Cm+guKn7Ghajadv+JvzWwVTwfPbrU72?=
 =?iso-8859-1?Q?UPDKmQfFVwd9E+ZlhBSnGeQNUVUaHWZyUhLncLeEakBNbps6UhX79jCeiv?=
 =?iso-8859-1?Q?9s36O8ydHIhBsN6XErkjcOchZ7g7eUxT0ZoZa0hHznEX7ESXzTUzeQbZQC?=
 =?iso-8859-1?Q?GmIyhUPWKSbsnWwDlh1IYQEp30j872Ifxzx5TY3KfXtZXGeibJ/hlot2rI?=
 =?iso-8859-1?Q?Q1eP3hMDG1ZTktp8eWgnxSc7EzMRayEcDPW2Qq6VGt1Sgf+OHHA8mzTaTt?=
 =?iso-8859-1?Q?idviWhIVPboRpI+Frw4OhXPuICYA7PRpUTHsh5+OPydxT97fGent3ZKpCo?=
 =?iso-8859-1?Q?+94ebRKXPYH5RIE8ev+U033ar5E6fEcfCKQ1rCKzmH1MLDJFjaW3O4lKFO?=
 =?iso-8859-1?Q?mbi/sS4+rQ2Bc582yTVuzqWJuvzMA3CsM5bdkJ00kIRswMEXzHRecMrKS1?=
 =?iso-8859-1?Q?PnRvslTZgwHaQMAA18FAUIGqMqzhSgjz7zPrVW8XlU75HjwVErUqXmni47?=
 =?iso-8859-1?Q?BniNXULEF13II4i7UEul88A2FPiUCtgMQ6VciT24MwoYf6nby6DiNJ633F?=
 =?iso-8859-1?Q?ZUaYMFXQoFPKzJ5aIbizZ5Y9r5wT4kPm4qgjV1sm6Z+4aFDsJMmqv1KONF?=
 =?iso-8859-1?Q?QUEfISGmOpT25Nrl0rrz2s?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR18MB5381.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hzWlCPGKpucG0e9Km4bc2SPO99LDLgImBT5AfLt5QnP75BiW1cO+7iWJsW?=
 =?iso-8859-1?Q?3ZBDwGNEEB5TdNlsmEFcssVtLiOXsGU5e06jTamkqtEZlwj+yhYtKBgFfv?=
 =?iso-8859-1?Q?mucSNv9W9kuGp6AeuCPZd64PAHJ6613txLNYCz8hhwYp8ze4VFJInA9nif?=
 =?iso-8859-1?Q?I6oq7at7wRld/pJwW1l7ep3vOig0imFYpvswvMIDGZahTNabHUkMIna2O8?=
 =?iso-8859-1?Q?KWkik9ZQdS3vRBDYq+KBDzqawztIo4e9TZVKsnePO+g+uMsbcf6xHC/gI8?=
 =?iso-8859-1?Q?nhDFoS/UNTQnsyyXKEP/6gDx6vaTn7olT8wd8K2Nn4ENeNU30wDM8RE5yZ?=
 =?iso-8859-1?Q?I7q1HLf331ZBQwnlJlN3/Z7n8YDY3eY0hEdXD2zOdSUrcOoOGynODIXg5K?=
 =?iso-8859-1?Q?rrSEWfmdbtLGT8XNSsm7Fv+Wn3QuGpYLY7wcjDOlH3HjSxu6r8gqT+znaM?=
 =?iso-8859-1?Q?7nIb92BqF5gF+MT2l1Qh2wXtqvSZNH1nKKtMLlKIosEl40KXNP/qpDWbKH?=
 =?iso-8859-1?Q?Px+UrJYTctA798XADWmFk237IbZLkEkPMWRvPBXMkdXjzuD+QqRBw8CDBN?=
 =?iso-8859-1?Q?ct+OkDQ5rB6mGzQ/JLXuL9tHX4U2yVF9v6xhureg+bAb8BBeCiR3dvWJyX?=
 =?iso-8859-1?Q?/6vzYzW8WsOBw2Qk1cHovLjqJ+Mw9nHqvc7ahpHJZ6SaDKGgqmjamdylUv?=
 =?iso-8859-1?Q?SHP50Rs4/IfO1709js6QFALsFBDNg8sK3U83H84VrwYCft6kDpsfOX3LBi?=
 =?iso-8859-1?Q?D4HvhVXv2PAoXMmi5xdKf5FIFJRN8M/AFFWpxWCsJiPCgFloUQ+0qeMeHi?=
 =?iso-8859-1?Q?zM4vqjFe89X1nhoC1D2uQXYMvWCHRewkPHsLvrPXvpstLSp1yfu5z/uq+A?=
 =?iso-8859-1?Q?H1ZQQdOjSVIq679azMeejq5uDowAgL3SQFeZeLl4alg8E8RdPtcFw688Iw?=
 =?iso-8859-1?Q?5antQztjO15WgLhNkKqkpY9AiiDDtACqvj8aeNrlppRhCJ8VxQmS2bgxLs?=
 =?iso-8859-1?Q?pznEYl4nvZKsQfEXGwSnLr06ZxELVGiVFLmoV7wrFcHbqCSbzvicb9qLv/?=
 =?iso-8859-1?Q?4TaW8rgCxx6DMngZysyB8KyPn7xJie8Ag+qwvlumFedvFfKoOeREsW3qt2?=
 =?iso-8859-1?Q?f+E3EEpRyCmNTYQH+pvkw71EB/WjaeCAZwdH8rd1AnSMHhYm/UvTy7BmjJ?=
 =?iso-8859-1?Q?uqZuZohzXIEgohl31UGOqKcMfvHTDQVU+B+kCGh+WuwVK71ikE18/B9eRd?=
 =?iso-8859-1?Q?Ah2jX1OSGBLi6T46KKIAFEaF7TFgswy4EirwMAxOzBlatx4V6+xpZchp3x?=
 =?iso-8859-1?Q?+MvyO2e1oKrMLz9Mlo+Z5wMdabdgoJitRJCPT+/jX919fxPJHTMJ6EXf7l?=
 =?iso-8859-1?Q?y96Sgu9K3cFqrrlLlaXk1kgNkbDCWKzO111mAX+HZ3952ycZxsbwE/arUI?=
 =?iso-8859-1?Q?GM5VD1Cwy99iwx+yIgTFFmuImMPZvA9ykCekdqwsiewzoe7iGo5L2q35o0?=
 =?iso-8859-1?Q?tiFETGnQNWwN2ngGMUdJjikS4U8uWwjGEhn/MN7nXfxCIXAS7LKVQltQmH?=
 =?iso-8859-1?Q?N3laHVzdRVKoBmt2gZCttnGBJmIuKtZiB4XLKz3jB3tIbPo3b0CZIIf1+y?=
 =?iso-8859-1?Q?zVsgTqpzdCrfKSaFUqaPBRsVN3PswPnvo8?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bc2b07-c373-4cff-e767-08dd5645ef0a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2025 09:14:11.9097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6tWSbyu6GWldWe6By2Uyfrwqjipr6H40idk0NH+UV/bl9diRCUT9zD8S6qPs5G6Ikl1NRKPQkWqxOxi8PZkqwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR18MB3793
X-Proofpoint-GUID: T39pCH7B8CY4_cqgZRzO_FZrj1WMrjls
X-Proofpoint-ORIG-GUID: T39pCH7B8CY4_cqgZRzO_FZrj1WMrjls
X-Authority-Analysis: v=2.4 cv=DaDtqutW c=1 sm=1 tr=0 ts=67bedb67 cx=c_pps a=TJva2t+EO/r6NhP7QVz7tA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=T2h4t0Lz3GQA:10 a=-AAbraWEqlQA:10
 a=pGLkceISAAAA:8 a=_jlGtV7tAAAA:8 a=e53pv_uEAAAA:8 a=07d9gI8wAAAA:8 a=VwQbUJbxAAAA:8 a=M5GUcnROAAAA:8 a=8dw26GDwni2ik4sjoL8A:9 a=wPNLvfGTeEIA:10 a=nlm17XC03S6CtCLSeiRr:22 a=i2WUat-zol0iyFTidwVo:22 a=e2CUPOnPG4QKp8I52DXD:22 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_01,2025-02-26_01,2024-11-22_01

=0A=
=0A=
________________________________________=0A=
From: Guenter Roeck <groeck7@gmail.com> on behalf of Guenter Roeck <linux@r=
oeck-us.net>=0A=
Sent: Tuesday, February 25, 2025 21:34=0A=
To: George Cherian=0A=
Cc: wim@linux-watchdog.org; corbet@lwn.net; linux-watchdog@vger.kernel.org;=
 linux-doc@vger.kernel.org; linux-kernel@vger.kernel.org=0A=
Subject: [EXTERNAL] Re: [PATCH v3] drivers: watchdog: Add support for panic=
 notifier callback=0A=
=0A=
=0A=
>>On Tue, Feb 25, 2025 at 02:06:15PM +0000, George Cherian wrote:=0A=
>> Watchdog is not turned off in kernel panic situation.=0A=
>> In certain systems this might prevent the successful loading=0A=
>> of kdump kernel. The kdump kernel might hit a watchdog reset=0A=
>> while it is booting.=0A=
>>=0A=
>> To avoid such scenarios add a panic notifier call back function=0A=
>> which can stop the watchdog. This provision can be enabled by=0A=
>> passing watchdog.stop_on_panic=3D1 via kernel command-line parameter.=0A=
>>=0A=
v> Signed-off-by: George Cherian <george.cherian@marvell.com>=0A=
>> ---=0A=
>> Changelog:=0A=
>> v1 -> v2=0A=
>> - Remove the per driver flag setting option=0A=
>> - Take the parameter via kernel command-line parameter to watchdog_core.=
=0A=
>>=0A=
>> v2 -> v3=0A=
>> - Remove the helper function watchdog_stop_on_panic() from watchdog.h.=
=0A=
>> - There are no users for this.=0A=
>>=0A=
>>  drivers/watchdog/watchdog_core.c | 42 ++++++++++++++++++++++++++++++++=
=0A=
>>  include/linux/watchdog.h         |  2 ++=0A=
>>  2 files changed, 44 insertions(+)=0A=
>>=0A=
>> diff --git a/drivers/watchdog/watchdog_core.c b/drivers/watchdog/watchdo=
g_core.c=0A=
>> index d46d8c8c01f2..8cbebe38b7dd 100644=0A=
>> --- a/drivers/watchdog/watchdog_core.c=0A=
>> +++ b/drivers/watchdog/watchdog_core.c=0A=
>> @@ -34,6 +34,7 @@=0A=
>>  #include <linux/idr.h>               /* For ida_* macros */=0A=
>>  #include <linux/err.h>               /* For IS_ERR macros */=0A=
>>  #include <linux/of.h>                /* For of_get_timeout_sec */=0A=
>> +#include <linux/panic_notifier.h> /* For panic handler */=0A=
>>  #include <linux/suspend.h>=0A=
>>=0A=
>>  #include "watchdog_core.h"   /* For watchdog_dev_register/... */=0A=
>> @@ -47,6 +48,9 @@ static int stop_on_reboot =3D -1;=0A=
>>  module_param(stop_on_reboot, int, 0444);=0A=
>>  MODULE_PARM_DESC(stop_on_reboot, "Stop watchdogs on reboot (0=3Dkeep wa=
tching, 1=3Dstop)");=0A=
>>=0A=
>> +static int stop_on_panic =3D -1;=0A=
>> +module_param(stop_on_panic, int, 0444);=0A=
=0A=
> This can now be bool.=0A=
Ack.=0A=
>> +MODULE_PARM_DESC(stop_on_panic, "Stop watchdogs on panic (0=3Dkeep watc=
hing, 1=3Dstop)");=0A=
>>  /*=0A=
>>   * Deferred Registration infrastructure.=0A=
>>   *=0A=
>> @@ -155,6 +159,23 @@ int watchdog_init_timeout(struct watchdog_device *w=
dd,=0A=
>>  }=0A=
>>  EXPORT_SYMBOL_GPL(watchdog_init_timeout);=0A=
>>=0A=
>> +static int watchdog_panic_notify(struct notifier_block *nb,=0A=
>>+                              unsigned long action, void *data)=0A=
>> +{=0A=
>> +     struct watchdog_device *wdd;=0A=
>> +=0A=
>> +     wdd =3D container_of(nb, struct watchdog_device, panic_nb);=0A=
>> +     if (watchdog_active(wdd)) {=0A=
>> +             int ret;=0A=
>> +=0A=
>> +             ret =3D wdd->ops->stop(wdd);=0A=
>> +             if (ret)=0A=
>> +                     return NOTIFY_BAD;=0A=
>> +     }=0A=
>> +=0A=
>> +     return NOTIFY_DONE;=0A=
>> +}=0A=
>> +=0A=
>>  static int watchdog_reboot_notifier(struct notifier_block *nb,=0A=
>>                                   unsigned long code, void *data)=0A=
>>  {=0A=
>> @@ -299,6 +320,14 @@ static int ___watchdog_register_device(struct watch=
dog_device *wdd)=0A=
>>                       clear_bit(WDOG_STOP_ON_REBOOT, &wdd->status);=0A=
>>       }=0A=
>>=0A=
>> +     /* Module parameter to force watchdog policy on panic. */=0A=
>> +     if (stop_on_panic !=3D -1) {=0A=
>> +             if (stop_on_panic &&  !test_bit(WDOG_NO_WAY_OUT, &wdd->sta=
tus))=0A=
>> +                     set_bit(WDOG_STOP_ON_PANIC, &wdd->status);=0A=
>> +             else=0A=
>> +                     clear_bit(WDOG_STOP_ON_PANIC, &wdd->status);=0A=
>> +     }=0A=
>> +=0A=
=0A=
> No longer needed here. See below.=0A=
>=0A=
Ack Got it.=0A=
>>       if (test_bit(WDOG_STOP_ON_REBOOT, &wdd->status)) {=0A=
>>               if (!wdd->ops->stop)=0A=
>>                       pr_warn("watchdog%d: stop_on_reboot not supported\=
n", wdd->id);=0A=
>> @@ -334,6 +363,16 @@ static int ___watchdog_register_device(struct watch=
dog_device *wdd)=0A=
>>                               wdd->id, ret);=0A=
>>       }=0A=
>>=0A=
>> +     if (test_bit(WDOG_STOP_ON_PANIC, &wdd->status)) {=0A=
>> +             if (!wdd->ops->stop) {=0A=
>> +                     pr_warn("watchdog%d: stop_on_panic not supported\n=
", wdd->id);=0A=
>> +             } else {=0A=
>> +                     wdd->panic_nb.notifier_call =3D watchdog_panic_not=
ify;=0A=
>> +                     atomic_notifier_chain_register(&panic_notifier_lis=
t,=0A=
>> +                                                    &wdd->panic_nb);=0A=
>> +             }=0A=
>> +     }=0A=
>=0A=
>Simplify to=0A=
>       if (stop_on_panic) {=0A=
>                if (!wdd->ops->stop) {=0A=
>                      pr_warn("watchdog%d: stop_on_panic not supported\n",=
 wdd->id);=0A=
>                } else {=0A=
>                        wdd->panic_nb.notifier_call =3D watchdog_panic_not=
ify;=0A=
>                        atomic_notifier_chain_register(&panic_notifier_lis=
t,=0A=
>                                                       &wdd->panic_nb);=0A=
>                        set_bit(WDOG_STOP_ON_PANIC, &wdd->status);=0A=
>                }=0A=
>        }=0A=
Okay will update to this.=0A=
=0A=
>This also fixes the bug where the unregistration function is called=0A=
>even if the notifier was not actually registered.=0A=
=0A=
>One thing I just realized is that we'll have to figure out if atomic=0A=
>notifiers can be used here unconditionally. Unless I am missing=0A=
>something, watchdog stop functions can sleep. Of course, sleeping=0A=
>while panic isn't a good idea. That means we _may_ need a driver=0A=
>flag indicating either that the stop function can sleep or that it=0A=
>won't. If we need that, I suggest we add WDIOF_STOP_MAYSLEEP or=0A=
>similar to the watchdog_info options field.=0A=
=0A=
Yes, that is correct there are certain .stop implementations which can slee=
p.=0A=
I will add a new WDIOF_STOP_MAYSLEEP  flag and enable the drivers with =0A=
this new flag. Only those drivers which have non-sleeping stop function wil=
l=0A=
be able to have this feature.=0A=
=0A=
I hope this is what you are expecting.=0A=
>=0A=
>Thanks,=0A=
>Guenter=0A=
=0A=
-George=


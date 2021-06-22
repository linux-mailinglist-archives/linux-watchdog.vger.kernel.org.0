Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D98733B0DB0
	for <lists+linux-watchdog@lfdr.de>; Tue, 22 Jun 2021 21:42:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232693AbhFVToO (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 22 Jun 2021 15:44:14 -0400
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:32930 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232021AbhFVToM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 22 Jun 2021 15:44:12 -0400
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
        by mx0a-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15MJcZAl000384;
        Tue, 22 Jun 2021 19:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=3GNTg/n9CToa+9JMABdxBT2VrO00lPa30io3LBpNwbI=;
 b=Jcw8UgBOWRHk3T2qZmoo5eB/FOKnoUKFoKpzbQm7pwUGKqKoDkJBlp/tnGcdp7Ho+mM4
 6MWuBecyI7bJNcA9br1giixR0+7NrLiRvWNj5See0tEQDRv7ilQAnzHBSzOaJAKtIPz1
 qYQjgHV/UJMYlxsPn1PG5QdL6rDtlNXjHpuPNcEQN8JL8e+6dlrHuXg/ISQGBiS577wj
 NifTMDJdaAqxPNN1zWB+ZFhD1W/LwW/0U9jNN4Kdglvw6LZBP7ofH6Rhc7aIE1W86rDN
 Oy9AicmcJkgpvvJsRcDnJf1rs1TRBZtlPCqhbQb45BxDddMnnQGcyXeTOydiYH4cpCM0 nw== 
Received: from g2t2354.austin.hpe.com (g2t2354.austin.hpe.com [15.233.44.27])
        by mx0a-002e3701.pphosted.com with ESMTP id 39b03xattp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 22 Jun 2021 19:41:36 +0000
Received: from G9W8454.americas.hpqcorp.net (g9w8454.houston.hp.com [16.216.161.4])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by g2t2354.austin.hpe.com (Postfix) with ESMTPS id 9FB0283;
        Tue, 22 Jun 2021 19:41:35 +0000 (UTC)
Received: from G9W8456.americas.hpqcorp.net (2002:10d8:a15f::10d8:a15f) by
 G9W8454.americas.hpqcorp.net (2002:10d8:a104::10d8:a104) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Tue, 22 Jun 2021 19:41:35 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (15.241.52.12) by
 G9W8456.americas.hpqcorp.net (16.216.161.95) with Microsoft SMTP Server (TLS)
 id 15.0.1497.18 via Frontend Transport; Tue, 22 Jun 2021 19:41:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jl3o6zPAyQXr87lISBKHMlbA2QwyVCzYmM8XMG47ILGjHVbSwF3dCpsKGNoZ2t+EztYgfpxUDpE42OBC/etjaQpu7amsws5rdN2V2RvbhjNGBNpWwRbNEo5x59XRR5SL/7zjIMiBj3RL4rHSVQG2NX2XrQp8n01+wFhRAp16lqo8OUQuQ88tV8jutHY5VGtfsWXN/sqcr/BFqwTuF5tYc6a3iOJ8iHuOb8bB9/PCZu0yxrg4uaCR1CbCtEd7glHLoD2mSRt5nmndmkqAy6Of2l1dYsk66Uksmf6JIiOtP3L9KOXybZa0nm1To8OhVvE5FpERsWDjd1AxARWlEG6pXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3GNTg/n9CToa+9JMABdxBT2VrO00lPa30io3LBpNwbI=;
 b=KF2t+gV/RTwsZieSIBHPSiq4BuWsaTmX9eIhkdCn6i8wI1I1mMaOfCYHDbaF3Poc+e2xN+wC3u5T502kuYKrHttm7nYjm/J38pCKgbc+dmI3Mg1rd5+LuiMxzHsNUEqHLAPbYnQD0hn71gfqm4acY+v0VUXqECl9PnJ5sLk3RB00zwDmpSdLQGqx+6c5/ZSZxuEP9OWyrYr2rMVH3Hcex5C039P3BCfkCWQPKu5y+QbPFINK5p+PGiGo3qRU5xB4LopzTY8yMn6V/qYihdj9MQV01oEL9SIq7d1DJRKgw/6XheSykhKjx/g//XbJqzOxc8yu1D/6Vk4N9UJ45xJm3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CS1PR8401MB1270.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7515::7) by CS1PR8401MB1159.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7512::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Tue, 22 Jun
 2021 19:41:34 +0000
Received: from CS1PR8401MB1270.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::1cf2:d4c0:b8ad:610a]) by CS1PR8401MB1270.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::1cf2:d4c0:b8ad:610a%12]) with mapi id 15.20.4264.018; Tue, 22 Jun
 2021 19:41:34 +0000
From:   "Klein, Curtis" <curtis.klein@hpe.com>
To:     Colin Ian King <colin.king@canonical.com>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: watchdog: Add hrtimer-based pretimeout feature
Thread-Topic: watchdog: Add hrtimer-based pretimeout feature
Thread-Index: AQHXZ3suIr/T46mzfkWwur/cAkPNd6sgVi0A
Date:   Tue, 22 Jun 2021 19:41:34 +0000
Message-ID: <CS1PR8401MB1270DDA86F85C700E060512089099@CS1PR8401MB1270.NAMPRD84.PROD.OUTLOOK.COM>
References: <244ef2f1-9dfb-6ac3-3ab8-f8f0cabda93f@canonical.com>
In-Reply-To: <244ef2f1-9dfb-6ac3-3ab8-f8f0cabda93f@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canonical.com; dkim=none (message not signed)
 header.d=none;canonical.com; dmarc=none action=none header.from=hpe.com;
x-originating-ip: [67.58.235.52]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7fbcc3c8-d98f-4be9-806f-08d935b5bdf3
x-ms-traffictypediagnostic: CS1PR8401MB1159:
x-microsoft-antispam-prvs: <CS1PR8401MB1159B2DFD75D0290506510CF89099@CS1PR8401MB1159.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:497;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hEyoFRQ9ijTTno7pQLsYeLEBGmX0UXHKNAN28ggiCLcIXXOMaqKGsk/EDD3jAN21AtBBSpqGnytYU64Lhtx/y2jQyfYmw3p0YiwhYZ6zT2NMNwX3QC6W2/bfkDBjViXaHMXlvliQ5zmrif7SZZiu8a32j22p8F/TJ6w3wI/c21LYdth1yUPPVAS1PVQwwNT0Kz9Ajv3/i/Uw9jvG6Wz1u63AlUBYQnKdSxOs80tB0k3BPmqkiXYjbxcoS8gXH2RK1hU59v3B6B3AzZeHoQzhZqkvqO62g0ZO+v34n/PBnoSz0pc585tEy4UGMb3w7ynOD22olxfsUamxfVWrlEpTLVid93DXxYiCA2oSwvtfLfM0K168cEuw8tstVEf6AQrOjuzgSWzItt+fD3PV9cXZ/d8XqfPDDLo6MbB19V+ae1MNNr1t09tLE47IVziGliAwDpUP21X3qWKQeNNwJ+cTW6VggA3fdvd/lA+F2m/4FDwct+G2LuchhiGjlMZ0kBIIapxKwH59mha1zKe6hLS1Z3H5wgaBgDsTqoVl/2spJnZiBREPla/otnV6ap6dqNa0PQ1uvN6FtXjxJdmqaZLEefruHYH6AITy1XbSfyc0xuw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CS1PR8401MB1270.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(366004)(346002)(376002)(396003)(136003)(39860400002)(316002)(5660300002)(6506007)(55016002)(76116006)(6916009)(8936002)(8676002)(122000001)(33656002)(38100700002)(86362001)(2906002)(66446008)(52536014)(66556008)(64756008)(66476007)(66946007)(4326008)(71200400001)(26005)(478600001)(9686003)(186003)(54906003)(7696005)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1JPQ1VpdlphbkNuQmx2aUtFdVIzSFdNTXV3SEdEZDF4T2Rzc3RqekdJeFV4?=
 =?utf-8?B?UUZwMFVGclgzZy9OZG81K1BWS1ZHMk5qTDNBOVkwRzRJUEhjb3RaVlB6NG9o?=
 =?utf-8?B?dHNJangzYjNSRGFQelhPMGJxUTdXcCsxWnI5WlpkVEtuZGVER0J1eGxERUlv?=
 =?utf-8?B?YklRTS9JY1lSRDBndElKbVlocDFzOFNzYi9tVGo0bHo4MjNIdUZvSmozYWUv?=
 =?utf-8?B?RUNsNnExU2UzMlZWSElaeERIQUQzK0daME9BVlJ3a0w0YkxodFVtaTc5Uk9h?=
 =?utf-8?B?K3dFQjE3NTdCL3NOK0lqMXorcE5zU25LVTFza042UVpXUE12c1hTL2xGNmNT?=
 =?utf-8?B?eHUzdCtMOXdrYXZVYlppeEx5cFl3ejYwQURjdzhiOVdPVWZlSTJJM2M5WDBp?=
 =?utf-8?B?czVlbkd0TU14blkwT24rOGNKZHNLOXRvVjhGOGJaQXVYeDFZRmFSczB5N3ha?=
 =?utf-8?B?UFFwNVRqUWF6Vzd6cVY1TGUwNG9zVU12bVhyNnBuNGxTdytMeVBsQnNxaW5S?=
 =?utf-8?B?K3hmVjlKd09uWHBDV1RQUWpLcURjcVlwbkdmL1BDcnRERWZTMStib1hvQmpx?=
 =?utf-8?B?NlVmMVh1Y1R1Z0pwNDVKWGkzYWNyNVFMS3ZyYW1iREo5UWhWVDJlVTMxN243?=
 =?utf-8?B?eDlRV2JYcVhoWjlETXd2K2ZtWW9OUTlRM0xEaHZlN2lyeGJnVzFYV1k0eGV3?=
 =?utf-8?B?OTZ1UXVuU1VhV09KeTV0S1U4OWpuT1NBL095RVgxMEw1azgwUHc2UVlzdVBO?=
 =?utf-8?B?cUo5MkNncVlSeFJyOGVncnU0b2FGeXdnQmhGbnpFN281Sjg0dlpXb3lsTlhU?=
 =?utf-8?B?US9uUGVtUmRKa2VoVkdiN0xlMVUzWG8xZDZ2RG1oRlVFNFJsZEZFUkVsLzlN?=
 =?utf-8?B?TTdKaElTbEJidjRhclBCUXI3eGxMRlhaQTJRcGxuaXl1eWNBcFAxaWhJQVpt?=
 =?utf-8?B?dU1QUTdWQjVlTHVnQUtGTEY2NXM1ajVBWDVEZkhtdEV3UEZNZTFsQ0xWSFF6?=
 =?utf-8?B?RFJWRkxaRjlkSVkzY2t6WG5hRENYbVlDVC9iaEJKQzh0c3QyZGdwdWV5dzlm?=
 =?utf-8?B?YWpHY243VU9Xd0NqdmdZdVkxZUVKU0RsVERZTzlhd2ZhUmF5UHFHdEFaQmhp?=
 =?utf-8?B?M0Q2VDFsM000YXVnVmtzZDdMY3U0cU93ZGlLZHcydUJtT0xFaGpUZVU2K3Fl?=
 =?utf-8?B?Nm9RelEvS0VRVUlwc1lmVnZGOHFjVXlBYWg2OCtJeXNnbmlibVRHRDFmWjUv?=
 =?utf-8?B?NzBySEVXYzZ3cDQyR0h5UDgxNTV3eFNpaEpaKzc0aHFGMkNZc0cwYmdVeU1o?=
 =?utf-8?B?VGE5V21kOTNKV2NOeGNjRG11WXpKbFc1TnN1OFk0V0hLTnk2WEpPakkzQ0xI?=
 =?utf-8?B?VXZla05qbEhtVm1UVVRtVlU3WEVIaWRCSzF5dVpyeHVacEZML0Fac093MEtp?=
 =?utf-8?B?UnFqdldFRDltUnpUQlB3RWR4c01ibEd5dDVSZno0b1V2OVE2dmFOTWlMNTdH?=
 =?utf-8?B?TWVwdDF2MDNnY3lTd2hnd285Ui9abTRHUFgyREg1aHdHNEdFOEVWTE1TaS8w?=
 =?utf-8?B?SkVZanlDNW4wWGZMdUhrenVXZnlsV2JFNEFGdkwrd2NQS1U1NnlkcDRRaTZE?=
 =?utf-8?B?WW5haDVJVWRvZWVTcVVyelpwQ20rdkNUcXZsQjg3SHFhMDBLU3YzL0dVeXNK?=
 =?utf-8?B?UldUTlBZMkoyNzZSTEE2YXBBR0xMZWVQL3RXUUVPSk9MWm5TckliVlZqNDFO?=
 =?utf-8?Q?LwQjiJucIH8OS078Go=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CS1PR8401MB1270.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbcc3c8-d98f-4be9-806f-08d935b5bdf3
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2021 19:41:34.0531
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TCK/eYO/i2NGzfG1J/lHImmNEGVxMDJ4THGRYbSDXAORn5/XI334rDaz1ALkK+jQNrM9euonq/rhIj81Lo8wzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB1159
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: FlbctrWob3NqGRaA4zVLmzu3-ILvw9xW
X-Proofpoint-GUID: FlbctrWob3NqGRaA4zVLmzu3-ILvw9xW
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-22_12:2021-06-22,2021-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 clxscore=1011
 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106220118
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

SGkgQ29saW4sDQoNClRoYW5rIHlvdSBmb3IgY2F0Y2hpbmcgdGhpcy4NCg0KT24gVHVlc2RheSwg
SnVuZSAyMiwgMjAyMSBhdCA4OjI4IEFNLCBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5v
bmljYWwuY29tPg0KPiBIaSwNCj4gDQo+IFN0YXRpYyBhbmFseXNpcyB1c2luZyBDb3Zlcml0eSBv
biBsaW51eC1uZXh0IGhhcyBmb3VuZCBhbiBpc3N1ZSBpbg0KPiBmdW5jdGlvbiB3YXRjaGRvZ19j
ZGV2X3VucmVnaXN0ZXIgaW4gc291cmNlDQo+IGRyaXZlcnMvd2F0Y2hkb2cvd2F0Y2hkb2dfZGV2
LmMgd2l0aCB0aGUgZm9sbG93aW5nIGNvbW1pdDoNCj4gDQo+IGNvbW1pdCA3YjdkMmZkYzhjM2Uz
ZjlmZGIzNTU4ZDY3NGUxZWVkZGMxNmM3ZDllDQo+IEF1dGhvcjogQ3VydGlzIEtsZWluIDxjdXJ0
aXMua2xlaW5AaHBlLmNvbT4NCj4gRGF0ZTogICBXZWQgRmViIDMgMTI6MTE6MzAgMjAyMSAtMDgw
MA0KPiANCj4gICAgIHdhdGNoZG9nOiBBZGQgaHJ0aW1lci1iYXNlZCBwcmV0aW1lb3V0IGZlYXR1
cmUNCj4gDQo+IFRoZSBhbmFseXNpcyBpcyBhcyBmb2xsb3dzOg0KPiANCj4gMTA4NCBzdGF0aWMg
dm9pZCAoc3RydWN0IHdhdGNoZG9nX2RldmljZSAqd2RkKQ0KPiAxMDg1IHsNCj4gMTA4NiAgICAg
ICAgc3RydWN0IHdhdGNoZG9nX2NvcmVfZGF0YSAqd2RfZGF0YSA9IHdkZC0+d2RfZGF0YTsNCj4g
MTA4Nw0KPiAxMDg4ICAgICAgICBjZGV2X2RldmljZV9kZWwoJndkX2RhdGEtPmNkZXYsICZ3ZF9k
YXRhLT5kZXYpOw0KPiANCj4gICAgIDEuIENvbmRpdGlvbiB3ZGQtPmlkID09IDAsIHRha2luZyB0
cnVlIGJyYW5jaC4NCj4gDQo+IDEwODkgICAgICAgIGlmICh3ZGQtPmlkID09IDApIHsNCj4gMTA5
MCAgICAgICAgICAgICAgICBtaXNjX2RlcmVnaXN0ZXIoJndhdGNoZG9nX21pc2NkZXYpOw0KPiAx
MDkxICAgICAgICAgICAgICAgIG9sZF93ZF9kYXRhID0gTlVMTDsNCj4gMTA5MiAgICAgICAgfQ0K
PiAxMDkzDQo+IA0KPiAgICAgMi4gQ29uZGl0aW9uIHdhdGNoZG9nX2FjdGl2ZSh3ZGQpLCB0YWtp
bmcgdHJ1ZSBicmFuY2guDQo+ICAgICAzLiBDb25kaXRpb24gdGVzdF9iaXQoNCwgJndkZC0+c3Rh
dHVzKSwgdGFraW5nIHRydWUgYnJhbmNoLg0KPiANCj4gMTA5NCAgICAgICAgaWYgKHdhdGNoZG9n
X2FjdGl2ZSh3ZGQpICYmDQo+IDEwOTUgICAgICAgICAgICB0ZXN0X2JpdChXRE9HX1NUT1BfT05f
VU5SRUdJU1RFUiwgJndkZC0+c3RhdHVzKSkgew0KPiAxMDk2ICAgICAgICAgICAgICAgIHdhdGNo
ZG9nX3N0b3Aod2RkKTsNCj4gMTA5NyAgICAgICAgfQ0KPiAxMDk4DQo+IDEwOTkgICAgICAgIG11
dGV4X2xvY2soJndkX2RhdGEtPmxvY2spOw0KPiAxMTAwICAgICAgICB3ZF9kYXRhLT53ZGQgPSBO
VUxMOw0KPiANCj4gICAgIDQuIGFzc2lnbl96ZXJvOiBBc3NpZ25pbmc6IHdkZC0+d2RfZGF0YSA9
IE5VTEwuDQo+IA0KPiAxMTAxICAgICAgICB3ZGQtPndkX2RhdGEgPSBOVUxMOw0KPiAxMTAyICAg
ICAgICBtdXRleF91bmxvY2soJndkX2RhdGEtPmxvY2spOw0KPiAxMTAzDQo+IDExMDQgICAgICAg
IGhydGltZXJfY2FuY2VsKCZ3ZF9kYXRhLT50aW1lcik7DQo+IDExMDUgICAgICAgIGt0aHJlYWRf
Y2FuY2VsX3dvcmtfc3luYygmd2RfZGF0YS0+d29yayk7DQo+IA0KPiBFeHBsaWNpdCBudWxsIGRl
cmVmZXJlbmNlZCAoRk9SV0FSRF9OVUxMKQ0KPiANCj4gICAgIDUuIHZhcl9kZXJlZl9tb2RlbDog
UGFzc2luZyB3ZGQgdG8gd2F0Y2hkb2dfaHJ0aW1lcl9wcmV0aW1lb3V0X3N0b3AsDQo+IHdoaWNo
IGRlcmVmZXJlbmNlcyBudWxsIHdkZC0+d2RfZGF0YS4NCj4gDQo+IDExMDYgICAgICAgIHdhdGNo
ZG9nX2hydGltZXJfcHJldGltZW91dF9zdG9wKHdkZCk7DQo+IDExMDcNCj4gMTEwOCAgICAgICAg
cHV0X2RldmljZSgmd2RfZGF0YS0+ZGV2KTsNCj4gMTEwOSB9DQo+IA0KPiBUaGUgY2FsbCB0byB3
YXRjaGRvZ19ocnRpbWVyX3ByZXRpbWVvdXRfc3RvcCBkZXJlZmVyZW5jZXMgd2RkIGFzDQo+IGZv
bGxvd3M6DQo+IA0KPiA0MSB2b2lkIHdhdGNoZG9nX2hydGltZXJfcHJldGltZW91dF9zdG9wKHN0
cnVjdCB3YXRjaGRvZ19kZXZpY2UgKndkZCkNCj4gNDIgew0KPiANCj4gICAxLiBkZXJlZl9wYXJt
X2ZpZWxkX2luX2NhbGw6IEZ1bmN0aW9uIGhydGltZXJfY2FuY2VsIGRlcmVmZXJlbmNlcyBhbg0K
PiBvZmZzZXQgb2ZmIHdkZC0+d2RfZGF0YS4NCj4gDQo+IDQzICAgICAgICBocnRpbWVyX2NhbmNl
bCgmd2RkLT53ZF9kYXRhLT5wcmV0aW1lb3V0X3RpbWVyKTsNCj4gNDQgfQ0KPiANCj4gU2luY2Ug
d2RkLT53ZF9kYXRhIGlzIHNldCB0byBOVUxMIG9uIGxpbmUgMTEwMSwgdGhlIGNhbGwgdG8NCj4g
d2F0Y2hkb2dfaHJ0aW1lcl9wcmV0aW1lb3V0X3N0b3Agd2lsbCBhbHdheXMgdHJpcCBhIG51bGwg
cG9pbnRlcg0KPiBkZXJlZmVyZW5jZS4gIFNoYWxsIHdlIGp1c3QgcmVtb3ZlIHRoYXQgY2FsbD8N
Cg0KWWVzLCBpdCBjYW4gYmUgcmVtb3ZlZC4gSXQncyBhY3R1YWxseSByZWR1bmRhbnQgc2luY2Ug
dGhlIGNhbGwgdG8gd2F0Y2hkb2dfc3RvcA0Kb24gbGluZSAxMDg5IHdpbGwgY2FsbCB3YXRjaGRv
Z19ocnRpbWVyX3ByZXRpbWVvdXRfc3RvcC4NCg0KSSB3aWxsIHNlbmQgb3V0IGEgZml4IHRvZGF5
Lg0KDQo+DQo+IENvbGluDQo=

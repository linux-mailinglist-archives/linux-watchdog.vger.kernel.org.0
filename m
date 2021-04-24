Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F09936A1C7
	for <lists+linux-watchdog@lfdr.de>; Sat, 24 Apr 2021 17:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231940AbhDXP3e (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 24 Apr 2021 11:29:34 -0400
Received: from mx08-001d1705.pphosted.com ([185.183.30.70]:28908 "EHLO
        mx08-001d1705.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231892AbhDXP3d (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 24 Apr 2021 11:29:33 -0400
Received: from pps.filterd (m0209322.ppops.net [127.0.0.1])
        by mx08-001d1705.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13OF8RJY002992;
        Sat, 24 Apr 2021 15:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sony.com; h=from : to : subject :
 date : message-id : references : in-reply-to : content-type : content-id :
 content-transfer-encoding : mime-version; s=S1;
 bh=ebsHdAEq6dr4wVRAsNehEF6/6HKhWNAE9NT19NAPMNY=;
 b=kjJGdMMOvtSWEvITqq0RIFnSQ4Q9qtap0AvIaG8KiUIi0cdsTaIAgSwbO8wV8c5wguFH
 9NoI1+uS8BiSBYVD8e3SLpgeoVh6zxQ2h8Wbd55JjvJMKrgbF2YQBkv4jCNClZKKBG3M
 fiJhgqvFLgYNXwIXY84LWnEM4gVtIPBDbhEc7q5nfvRq4e75SOny67QqhuQR/OMUWbTc
 5Q7fstOr+zi8Rs/ARhRjkJflPAbXekdUWkk/+szMpXFmBU4mzg9YTXHdJAClfGia24Es
 cusMaDQwWhjkKddUos1HMUt8e8Ju14XX/H5Hn2f+XskHKGnvNVWWhf19xU81B7faEp6I +g== 
Received: from eur03-db5-obe.outbound.protection.outlook.com (mail-db5eur03lp2053.outbound.protection.outlook.com [104.47.10.53])
        by mx08-001d1705.pphosted.com with ESMTP id 384a49ghnn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 24 Apr 2021 15:28:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAtXnDDBKU5usoEtwwBX6+RBvYZPC46UuasidDpmBVaiTN8nOHjAhejes+UjuFDFSIvi4XTtq5HpIAvuk4Fnd8rx69V3aDoxnBrVVTOTPDuR84m2hi9X6HXmjNtgQpAYTMMRYWTv44a0HpmQREZhKHqgd2HBGiRcLyF6ru6xXU0xXxKI2wcDWXeRPA6FPfd3ykuV3Y8WIQ5Q1Ei0JYXBo1pD3W8l6CTT5QrvMf1jkUWBrBHsdO8doE94l0YHqey2if1f3Y92r9bRvhgiVgJgxeTZZAXZcu6Fssrojp+j9LiEbirJeGXOY8B53+bfjT2K9sYk2v7wPzC2+Wp+5W35IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ebsHdAEq6dr4wVRAsNehEF6/6HKhWNAE9NT19NAPMNY=;
 b=ZE09tCPGGa3EHFAGllLLikXsoSCY9JlEu7g6U6niOJq9Gq+zEHF4/rdJzpC7QiKb7CsPEKgNfjFdTPxPATnOKsnaM51rssAmjE8NlA065ZQrKQxQG9ridXY7tx0f0x/j2ayUBbzkuirjVHh+m4eualIrT1SoZLkNT+sKNwoAgc+NyCpJ0qQ+GjCXqWfaz4CtET7D+DWhexTpgK54hhZBVl0clVqSfIHwKYkOZ/nLyoP0tInSp7c1qFPk6iW4/5cxDCbz5cGVDW7pOFpRKoECERq/plTQZCsqvuRE1cop1c5rK3Yik3nbmCPToMg6cgnCLoXrzuV/OXZx7qtY3yzyOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sony.com; dmarc=pass action=none header.from=sony.com;
 dkim=pass header.d=sony.com; arc=none
Received: from AM9P193MB1491.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:306::20)
 by AM9P193MB1441.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:2fd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Sat, 24 Apr
 2021 15:27:32 +0000
Received: from AM9P193MB1491.EURP193.PROD.OUTLOOK.COM
 ([fe80::35b3:3e5e:6533:84e0]) by AM9P193MB1491.EURP193.PROD.OUTLOOK.COM
 ([fe80::35b3:3e5e:6533:84e0%5]) with mapi id 15.20.4065.025; Sat, 24 Apr 2021
 15:27:32 +0000
From:   <Peter.Enderborg@sony.com>
To:     <linux@roeck-us.net>, <wim@linux-watchdog.org>,
        <akpm@linux-foundation.org>, <linux-watchdog@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        <shakeelb@google.com>
Subject: Re: [RFC PATCH] watchdog: Adding softwatchdog
Thread-Topic: [RFC PATCH] watchdog: Adding softwatchdog
Thread-Index: AQHXOPRHJMESqgFAQEC7n9VkV8fdEqrDve8AgAAM14A=
Date:   Sat, 24 Apr 2021 15:27:32 +0000
Message-ID: <ed9e0944-fc75-6705-98ea-3f6cf86f5053@sony.com>
References: <20210424102555.28203-1-peter.enderborg@sony.com>
 <20210424102555.28203-2-peter.enderborg@sony.com>
 <d5db5606-f074-6d0e-2316-8ff41af25cfd@roeck-us.net>
In-Reply-To: <d5db5606-f074-6d0e-2316-8ff41af25cfd@roeck-us.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=sony.com;
x-originating-ip: [37.139.156.40]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c481bec-4044-45b4-1c8e-08d907357ac6
x-ms-traffictypediagnostic: AM9P193MB1441:
x-microsoft-antispam-prvs: <AM9P193MB1441D6F3C3E6404F9645C75886449@AM9P193MB1441.EURP193.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6EoPSWraeBCrseRAggMpZsIX9yRj/N/WjAldOMsNY1vJxv4ZUMFOThiJOoPor/8EexO5lKWRob5VzmCEfh3NhYSMPWjrnWKF8E/DRxvpVDa00mHK/McOHQKIctyT6MnECvSnhrycaTK1bn551PHu82b8EheGFEr6Wvj6mJbD+7pynQLAhtYpBQ8OyRTaAiwHn+B8EVFbo1CzmJGgRCwOJdvuHlh+YlMDo9e3kwMDK1L8fkC4QseS0B9FwXK07Xc+iQA+ZJ8F13KCSftxGyWGbIf2qcNpzfwqlzkRAjN/EiMgvU6lFMgJhQmAmiRLSxat9sCT/fPJPBxLKwEkCsXbAJ1GEvh4uU5ric+zySDeKhBJH3NxRw9Cx7+sj5tfG/iI5w4ufm5l9PfmxQSbuYh5CPj4YszIAOV87vtkE+/6a8qyf5RK2DszvwjqwITNDB55XWjHSAiPSM/HQz7iCaN8hUpq5MWfyvwMQCLv7ckAWgzs1DBTKoO9RCgqvZHHmo0NxjgW1qwSi4VBoPp6kdq9cP3ptX0MmYZkGydyiUf3jCKongO4OqOi8DcCDGXCAr5zx4/JteLFuST1foFe5L1VkAehrQUt87wkQOC3CXQZizCJgzudASU+BZkqSjMtX70HCreJxeyOzk9pLUMLyfv3xsTsoOA2VZLR7u9XECsDY5a5bLOY68vGAOBi4igP+fmR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P193MB1491.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(396003)(366004)(346002)(376002)(136003)(6486002)(2616005)(26005)(186003)(478600001)(6512007)(316002)(110136005)(5660300002)(2906002)(66446008)(86362001)(66556008)(66476007)(122000001)(31686004)(38100700002)(31696002)(64756008)(36756003)(6506007)(53546011)(8936002)(8676002)(71200400001)(83380400001)(66946007)(91956017)(76116006)(45980500001)(43740500002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?M1pQNUl0WGEwb2RiVjhPbFg1azgxTGVadHYxc2tmSkdnN05wUzIxcHNMbGlY?=
 =?utf-8?B?MkQvMzVja0IrUU1VS1loMUY0UHN2Y3prUk9ockJOR05TMmpTcDhmanJtQnlS?=
 =?utf-8?B?YkwwalVnV29oaHVTMmcrbzdQWGVoTVdiMDg5bXBCSjdZZlhXRlpPMUZtS1Q3?=
 =?utf-8?B?aW9MdkttaEhyRWhOalA2OCtkU1VsRjlCZHpEUkptd2FYVDBFZTdYT01lVFo5?=
 =?utf-8?B?ZmlpeWErMGJKYm4zL20xeW1jUjlEQTdtRDdZa0MxWHM5VDZsQ014V0VCREZh?=
 =?utf-8?B?M0crV1p2YXBjSGM2ZXd4eWZLUkk3dmpDNVlxZXdzd0pjZGE1ZklqN3dNb0ZB?=
 =?utf-8?B?N3o2UnBMMEFtaDZGMTNldjArYVJxRE5wbldDS0JpUGttMDFJTnFEb2xrdE11?=
 =?utf-8?B?TDIvNHV3WS9tZ1lObkNlcUpKbXdScnJ2SjY4SzRzRjhIdWx1UTRMOExzT1RI?=
 =?utf-8?B?cFRBb2R3V0RuTHQ3TUtKZC9GQUFzWUt4Wkl4M0ZPZWFSNVg4K2ZLOHhXZ3Fu?=
 =?utf-8?B?ZkJRcnhVRjhFa1V5cEhvLzU2c2t0Q2tlaTJja3lGRFdjemhqMWp3V1p5WUpS?=
 =?utf-8?B?VWZuVmdvRWFTZmhXamI1L2R5OTFieWFxRkdrQjhYeEF4MnU0WFFDUDhFeTZQ?=
 =?utf-8?B?cmtYazlMb1lPTmZBaUxaTWRvNkdnK25LdHBYTDNRRDhrakpzYjlEenFUM0dy?=
 =?utf-8?B?NHNkdzc3bzg5OFN0Z3J1bk5zRkVwRGdpUmFCZEJCQzl4aUJrU2VqMVhXb09w?=
 =?utf-8?B?SEhGekFGcFlqWHh3dGNzTUVCN1h0MDNOY0J4TEhXOHMzeURWOVJ6dlV3QkRF?=
 =?utf-8?B?bGhlVHlvUE5KbTFFYzBWUFVKMG54LzF0R2piT3pkSmdzYWNnV1hxWjV3U3ky?=
 =?utf-8?B?SXdPbmtNYnJGRVcvK3FvUzlvYzRHQ201cGVZM2Fyc0lraEtaWXJkV0pEUit0?=
 =?utf-8?B?VkxhN3kyRXUwaFRLOFArc0NaOUR3SXFmMUVkUW1Vd2FFUDVCSmZ4WjFkY0Va?=
 =?utf-8?B?Q2Q0RXFiMDFhZ1VxZzhFOHgxVWIzV3RPWGY0QU5MU3l3SlQvUGswWnBKZWFZ?=
 =?utf-8?B?emVUTkQ0eTJHMUFtQi8vZ2Yxci9BamJNWGU2YmJ3V085d0sxdm0zUWMxbnZ2?=
 =?utf-8?B?UnlkTWo1anE0ZzBrbVVUcjA2M3k0MnlMcXhpVTc5UGJFY3U0YWVjVHpCQldD?=
 =?utf-8?B?QXFzYm82ek5VR096SUZRb2xzR1lwZHJyYW1KWno5T0NQRUJzM2ZjZHMrbmlr?=
 =?utf-8?B?UU1malQwOWszalVPdnpKTUZ6S2hDYVZXVmR3a0hWSzk5R0FnMUJlck56STlN?=
 =?utf-8?B?eWtkVjVJM3ZrK1hvU0NTdnhrWnZYWUhHZThrZnFicm9ZNXlVUTVjWWErMksz?=
 =?utf-8?B?WlBiNGxjeFA0MzZ4Y1drWExWaFFGemNLODNrVGx5UnJtdXVYTzdUVWI5bE12?=
 =?utf-8?B?RjdabXVDNHVNeXZmZ2FMcXJVR2xSdE1nY1pCUGJLVTdUZ2FCelZHck42NXJO?=
 =?utf-8?B?aC9Lajc3bFd4Q28wL3BNL1o1MkxvNVh1L0c5MHhpakd6YmY1SUo5S1VBWDJH?=
 =?utf-8?B?ZGZQeFBtSmF2N292bHhTSkZtbXpkQlpLNFdzTmlNK1p4RGUvbk1ZeXNTVEVQ?=
 =?utf-8?B?Y3ROSkRQVmlmTlNCeEdCd0RkbnVTbEh6MnJWdDFUVHdNVXl1YnkwVUdBbWhO?=
 =?utf-8?B?L1VvN2ZYL3Nva0NTZDVOdlp0M1hNa0U2ZnltNGFmNWNNazVielpZUkY4Nm9D?=
 =?utf-8?Q?OibCoRaAcM5lYwBq8GCGZWFDXRBGYQ/O5fC21v4?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA665B59E07D5049B43C30E43EB28785@EURP193.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sony.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9P193MB1491.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c481bec-4044-45b4-1c8e-08d907357ac6
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2021 15:27:32.2398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 66c65d8a-9158-4521-a2d8-664963db48e4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f1+row2xx44U94rm13YtO0LCrTLqWcpRyjGdUUaRzg18PoDpfO2m8G2WAhU4P18OYCO+rUTHgi0tKDytvp2RYEUr+4L21YJeOOYjDrMh7/w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9P193MB1441
X-Proofpoint-GUID: jCjXT4IBrQwixA5Z8qCcPHjCPnzaIkGi
X-Proofpoint-ORIG-GUID: jCjXT4IBrQwixA5Z8qCcPHjCPnzaIkGi
X-Sony-Outbound-GUID: jCjXT4IBrQwixA5Z8qCcPHjCPnzaIkGi
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-24_05:2021-04-23,2021-04-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104240115
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gNC8yNC8yMSA0OjQxIFBNLCBHdWVudGVyIFJvZWNrIHdyb3RlOg0KPiBPbiA0LzI0LzIxIDM6
MjUgQU0sIFBldGVyIEVuZGVyYm9yZyB3cm90ZToNCj4+IFRoaXMgaXMgbm90IGEgcmVib290aW5n
IHdhdGNoZG9nLiBJdCdzIGZ1bmN0aW9uIGlzIHRvIHRha2Ugb3RoZXINCj4+IGFjdGlvbnMgdGhh
biBhIGhhcmQgcmVib290LiBPbiBtYW55IGNvbXBsZXggc3lzdGVtIHRoZXJlIGlzIHNvbWUNCj4+
IGtpbmQgb2YgbWFuYWdlciB0aGF0IG1vbml0b3IgYW5kIHRha2UgYWN0aW9uIG9uIHNsb3cgc3lz
dGVtcy4NCj4+IEFuZHJvaWQgaGFzIGl0J3MgbG93bWVtb3J5a2lsbGVyIChsbWtkKSwgZGVza3Rv
cHMgaGFzIGVhcmx5b29tLg0KPj4gVGhpcyB3YXRjaGRvZyBjYW4gYmUgdXNlZCB0byBoZWxwIG1v
bml0b3IgdG8gcHJlZm9ybSBzb21lIGJhc2ljDQo+PiBhY3Rpb24gdG8ga2VlcCB0aGUgbW9uaXRv
ciBydW5uaW5nLg0KPj4NCj4+IEl0IGNhbiBhbHNvIGJlIHVzZWQgc3RhbmRhbG9uZS4gVGhpcyBh
ZGQgYSBwb2xpY3kgdGhhdCBpcw0KPj4ga2lsbGluZyB0aGUgcHJvY2VzcyB3aXRoIGhpZ2hlc3Qg
b29tX3Njb3JlX2FkaiBhbmQgdXNpbmcNCj4+IG9vbSBmdW5jdGlvbnMgdG8gaXQgcXVpY2tseS4g
SSB0aGluayBpdCBpcyBhIGdvb2QgdXNlY2FzZQ0KPj4gZm9yIHRoZSBwYXRjaC4gTWVtb3J5IHNp
dWF0aW9ucyBjYW4gYmUgcHJvYmxlbWF0aWMgZm9yDQo+PiBzb2Z0d2FyZSB0aGF0IG1vbml0b3Ig
c3lzdGVtLCBidXQgb3RoZXIgcHJvbGljeXMgY2FuDQo+PiBzaG91bGQgYWxzbyBiZSBwb3NzaWJs
ZS4gTGlrZSBwaWNraW5nIHRhc2tzIGZyb20gYSBtZW1jZywgb3INCj4+IHNwZWNpZmljIFVJRCdz
IG9yIHdoYXQgZXZlciBpcyBsb3cgcHJpb3JpdHkuDQo+PiAtLS0NCj4gTkFDSy4gQmVzaWRlcyB0
aGlzIG5vdCBmb2xsb3dpbmcgdGhlIG5ldyB3YXRjaGRvZyBBUEksIHRoZSB0YXNrDQo+IG9mIGEg
d2F0Y2hkb2cgaXMgdG8gcmVzZXQgdGhlIHN5c3RlbSBvbiBmYWlsdXJlLiBJdHMgdGFzayBpcyBt
b3N0DQo+IGRlZmluaXRlbHkgbm90IHRvIHJlLWltcGxlbWVudCB0aGUgb29tIGtpbGxlciBpbiBh
bnkgd2F5LCBzaGFwZSwNCj4gb3IgZm9ybS4NCj4NCj4gR3VlbnRlcg0KDQpEbyB5b3UgaGF2ZSBi
ZXR0ZXIgaWRlYSB3aGVyZSB0aGUgcmUtaW52ZW50ZWQgd2hlZWwgbWlnaHQNCmZpdCBiZXR0ZXIg
aWYgaXQgbm90IGZvciB3YXRjaGRvZyBBUEk/DQoNCg0KPg0KPj4gIGRyaXZlcnMvd2F0Y2hkb2cv
TWFrZWZpbGUgICAgICAgfCAgIDIgKw0KPj4gIGRyaXZlcnMvd2F0Y2hkb2cvc29mdHdhdGNoZG9n
LmMgfCAyMzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+ICBpbmNsdWRlL3Vh
cGkvbGludXgvd2F0Y2hkb2cuaCAgIHwgICA2ICsNCj4+ICBtbS9vb21fa2lsbC5jICAgICAgICAg
ICAgICAgICAgIHwgICA0ICstDQo+PiAgNCBmaWxlcyBjaGFuZ2VkLCAyNDEgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy93YXRjaGRv
Zy9zb2Z0d2F0Y2hkb2cuYw0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3dhdGNoZG9nL01h
a2VmaWxlIGIvZHJpdmVycy93YXRjaGRvZy9NYWtlZmlsZQ0KPj4gaW5kZXggZjNhNjU0MGU3MjVl
Li5iZmY4ZjYxZmU1MDQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3dhdGNoZG9nL01ha2VmaWxl
DQo+PiArKysgYi9kcml2ZXJzL3dhdGNoZG9nL01ha2VmaWxlDQo+PiBAQCAtMjIxLDMgKzIyMSw1
IEBAIG9iai0kKENPTkZJR19NRU5aMDY5X1dBVENIRE9HKSArPSBtZW56Njlfd2R0Lm8NCj4+ICBv
YmotJChDT05GSUdfUkFWRV9TUF9XQVRDSERPRykgKz0gcmF2ZS1zcC13ZHQubw0KPj4gIG9iai0k
KENPTkZJR19TVFBNSUMxX1dBVENIRE9HKSArPSBzdHBtaWMxX3dkdC5vDQo+PiAgb2JqLSQoQ09O
RklHX1NMMjhDUExEX1dBVENIRE9HKSArPSBzbDI4Y3BsZF93ZHQubw0KPj4gKw0KPj4gK29iai15
ICs9IHNvZnR3YXRjaGRvZy5vDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy93YXRjaGRvZy9zb2Z0
d2F0Y2hkb2cuYyBiL2RyaXZlcnMvd2F0Y2hkb2cvc29mdHdhdGNoZG9nLmMNCj4+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmRkNzE1MzA5MmRhOA0KPj4gLS0t
IC9kZXYvbnVsbA0KPj4gKysrIGIvZHJpdmVycy93YXRjaGRvZy9zb2Z0d2F0Y2hkb2cuYw0KPj4g
QEAgLTAsMCArMSwyMzEgQEANCj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIu
MA0KPj4gKy8qIFNvZnQgd2F0Y2hkb2cNCj4+ICsgKiAgVGhpcyBpcyBhIFJGQyBvZiBhIHdhdGNo
ZG9nIGRvZXMgZG8gbm90IHJlYm9vdCB0aGUgc3lzdGVtLg0KPj4gKyAqICBJbnN0ZWFkIGl0IGRv
IGEgcHJlIGRlZmluZWQgYWN0aW9uDQo+PiArICoNCj4+ICsgKiAgQXV0aG9yOiBwZXRlci5lbmRl
cmJvcmdAc29ueS5jb20NCj4+ICsgKi8NCj4+ICsNCj4+ICsjaW5jbHVkZSA8bGludXgva2VybmVs
Lmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4L21tLmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4L3NsYWIu
aD4NCj4+ICsjaW5jbHVkZSA8bGludXgvb29tLmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4L21vZHVs
ZS5oPg0KPj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGVwYXJhbS5oPg0KPj4gKyNpbmNsdWRlIDxs
aW51eC90eXBlcy5oPg0KPj4gKyNpbmNsdWRlIDxsaW51eC90aW1lci5oPg0KPj4gKyNpbmNsdWRl
IDxsaW51eC9taXNjZGV2aWNlLmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4L3dhdGNoZG9nLmg+DQo+
PiArI2luY2x1ZGUgPGxpbnV4L25vdGlmaWVyLmg+DQo+PiArI2luY2x1ZGUgPGxpbnV4L2luaXQu
aD4NCj4+ICsjaW5jbHVkZSA8bGludXgvZnMuaD4NCj4+ICsNCj4+ICt2b2lkIHdha2Vfb29tX3Jl
YXBlcihzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzayk7IC8qIG5lZWQgdG8gcHVibGljIC4uLiAqLw0K
Pj4gK3ZvaWQgX19vb21fa2lsbF9wcm9jZXNzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdmljdGltLCBj
b25zdCBjaGFyICptZXNzYWdlKTsgLyogaG1tICovDQo+PiArDQo+PiArc3RhdGljIHN0cnVjdCB0
aW1lcl9saXN0IHN3ZF90aW1lcjsNCj4+ICtzdGF0aWMgaW50IGhlYXJ0YmVhdCA9IDUwMDsNCj4+
ICtzdGF0aWMgdW5zaWduZWQgbG9uZyBzd2RfaXNfb3BlbjsNCj4+ICtzdGF0aWMgY2hhciBleHBl
Y3RfY2xvc2U7DQo+PiArc3RhdGljIGJvb2wgbm93YXlvdXQgPSBXQVRDSERPR19OT1dBWU9VVDsN
Cj4+ICsNCj4+ICsvKiBhIGV4YW1wbGUgcG9saWN5IGRvaW5nIGEgcHJvY2VzcyBraWxsIGJ5IGNh
bGxpbmcNCj4+ICsgKiAgZnVuY3Rpb25zIHdpdGhpbiBvb20ta2lsbGVyLg0KPj4gKyAqLw0KPj4g
K3N0YXRpYyBpbnQgcG9saWN5X2Zhc3Rfa2lsbF9vb21fc2NvcmVfYWRqKHZvaWQpDQo+PiArew0K
Pj4gKwlzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzazsNCj4+ICsJc3RydWN0IHRhc2tfc3RydWN0ICpz
ZWxlY3RlZCA9IE5VTEw7DQo+PiArCWludCBoaWdoZXN0ID0gMDsNCj4+ICsNCj4+ICsJcmN1X3Jl
YWRfbG9jaygpOw0KPj4gKwlmb3JfZWFjaF9wcm9jZXNzKHRzaykgew0KPj4gKwkJc3RydWN0IHRh
c2tfc3RydWN0ICpjYW5kaWRhdGU7DQo+PiArDQo+PiArCQlpZiAodHNrLT5mbGFncyAmIFBGX0tU
SFJFQUQpDQo+PiArCQkJY29udGludWU7DQo+PiArDQo+PiArCQkvKiBJZ25vcmUgdGFzayBpZiBj
b3JlZHVtcCBpbiBwcm9ncmVzcyAqLw0KPj4gKwkJaWYgKHRzay0+bW0gJiYgdHNrLT5tbS0+Y29y
ZV9zdGF0ZSkNCj4+ICsJCQljb250aW51ZTsNCj4+ICsJCWNhbmRpZGF0ZSA9IGZpbmRfbG9ja190
YXNrX21tKHRzayk7DQo+PiArCQlpZiAoIWNhbmRpZGF0ZSkNCj4+ICsJCQljb250aW51ZTsNCj4+
ICsNCj4+ICsJCWlmIChoaWdoZXN0IDwgY2FuZGlkYXRlLT5zaWduYWwtPm9vbV9zY29yZV9hZGop
IHsNCj4+ICsJCQkvKiBmb3IgdGVzdCBkb250IGtpbGwgbGV2ZWwgMCAqLw0KPj4gKwkJCWhpZ2hl
c3QgPSBjYW5kaWRhdGUtPnNpZ25hbC0+b29tX3Njb3JlX2FkajsNCj4+ICsJCQlzZWxlY3RlZCA9
IGNhbmRpZGF0ZTsNCj4+ICsJCQlwcl9pbmZvKCJuZXcgc2VsZWN0ZWQgJWQgJWQiLCBzZWxlY3Rl
ZC0+cGlkLA0KPj4gKwkJCQlzZWxlY3RlZC0+c2lnbmFsLT5vb21fc2NvcmVfYWRqKTsNCj4+ICsJ
CX0NCj4+ICsJCXRhc2tfdW5sb2NrKGNhbmRpZGF0ZSk7DQo+PiArCX0NCj4+ICsJaWYgKHNlbGVj
dGVkKQ0KPj4gKwkJZ2V0X3Rhc2tfc3RydWN0KHNlbGVjdGVkKTsNCj4+ICsNCj4+ICsJcmN1X3Jl
YWRfdW5sb2NrKCk7DQo+PiArCWlmIChzZWxlY3RlZCkgew0KPj4gKwkJaW50IHBpZCA9IHNlbGVj
dGVkLT5waWQ7DQo+PiArDQo+PiArCQlwcl9pbmZvKCJzd2Qga2lsbGluZzogJWQiLCBzZWxlY3Rl
ZC0+cGlkKTsNCj4+ICsJCV9fb29tX2tpbGxfcHJvY2VzcyhzZWxlY3RlZCwgInN3ZCIpOw0KPj4g
KwkJcmV0dXJuIHBpZDsNCj4+ICsJfQ0KPj4gKwlyZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiAr
c3RhdGljIHZvaWQgc3dkX3Bpbmcodm9pZCkNCj4+ICt7DQo+PiArCW1vZF90aW1lcigmc3dkX3Rp
bWVyLCBqaWZmaWVzICsgaGVhcnRiZWF0KTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGxvbmcg
c3dkX2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBpbnQgY21kLCB1bnNpZ25lZCBs
b25nIGFyZykNCj4+ICt7DQo+PiArCXZvaWQgX191c2VyICphcmdwID0gKHZvaWQgX191c2VyICop
YXJnOw0KPj4gKwlpbnQgX191c2VyICpwID0gYXJncDsNCj4+ICsJaW50IG5ld19oZWFydGJlYXQ7
DQo+PiArCWludCBzdGF0dXM7DQo+PiArDQo+PiArCXN0cnVjdCB3YXRjaGRvZ19pbmZvIGlkZW50
ID0gew0KPj4gKwkJLm9wdGlvbnMgPQkJV0RJT0ZfU0VUVElNRU9VVHwNCj4+ICsJCQkJCVdESU9G
X01BR0lDQ0xPU0V8DQo+PiArCQkJCQlXRElPRl9PT01LSUxMIHwNCj4+ICsJCQkJCVdESU9GX0FV
VE9LSUxMLA0KPj4gKwkJLmlkZW50aXR5ID0JCSJzd2QiLA0KPj4gKwl9Ow0KPj4gKw0KPj4gKwlz
d2l0Y2ggKGNtZCkgew0KPj4gKwljYXNlIFdESU9DX0dFVFNVUFBPUlQ6DQo+PiArCQlyZXR1cm4g
Y29weV90b191c2VyKGFyZ3AsICZpZGVudCwgc2l6ZW9mKGlkZW50KSkgPyAtRUZBVUxUIDogMDsN
Cj4+ICsJY2FzZSBXRElPQ19HRVRTVEFUVVM6DQo+PiArCQlzdGF0dXMgPSAwOw0KPj4gKwkJcmV0
dXJuIHB1dF91c2VyKHN0YXR1cywgcCk7DQo+PiArCWNhc2UgV0RJT0NfR0VUQk9PVFNUQVRVUzoN
Cj4+ICsJCXJldHVybiBwdXRfdXNlcigwLCBwKTsNCj4+ICsJY2FzZSBXRElPQ19LRUVQQUxJVkU6
DQo+PiArCQlzd2RfcGluZygpOw0KPj4gKwkJcmV0dXJuIDA7DQo+PiArCWNhc2UgV0RJT0NfU0VU
VElNRU9VVDoNCj4+ICsJCWlmIChnZXRfdXNlcihuZXdfaGVhcnRiZWF0LCBwKSkNCj4+ICsJCQly
ZXR1cm4gLUVGQVVMVDsNCj4+ICsJCWhlYXJ0YmVhdCA9IG5ld19oZWFydGJlYXQ7DQo+PiArCQlm
YWxsdGhyb3VnaDsNCj4+ICsJY2FzZSBXRElPQ19HRVRUSU1FT1VUOg0KPj4gKwkJcmV0dXJuIHB1
dF91c2VyKGhlYXJ0YmVhdCwgcCk7DQo+PiArCWRlZmF1bHQ6DQo+PiArCQlyZXR1cm4gLUVOT1RU
WTsNCj4+ICsJfQ0KPj4gKwlyZXR1cm4gLUVOT1RUWTsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGlj
IHZvaWQgc3dkX3RpbWVyX2Z1bmMoc3RydWN0IHRpbWVyX2xpc3QgKnVudXNlZCkNCj4+ICt7DQo+
PiArCWludCByZXM7DQo+PiArDQo+PiArCXByX2luZm8oInN3ZCB0aW1lciAlZFxuIiwgaGVhcnRi
ZWF0KTsNCj4+ICsJcmVzID0gcG9saWN5X2Zhc3Rfa2lsbF9vb21fc2NvcmVfYWRqKCk7DQo+PiAr
CWlmIChyZXMpDQo+PiArCQlwcl9pbmZvKCJraWxsZWQgJWRcbiIsIHJlcyk7DQo+PiArDQo+PiAr
CW1vZF90aW1lcigmc3dkX3RpbWVyLCBqaWZmaWVzICsgaGVhcnRiZWF0KTsNCj4+ICt9DQo+PiAr
DQo+PiArc3RhdGljIGludCBzd2Rfc3RhcnQodm9pZCkNCj4+ICt7DQo+PiArCWFkZF90aW1lcigm
c3dkX3RpbWVyKTsNCj4+ICsJcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbnQg
c3dkX3N0b3Aodm9pZCkNCj4+ICt7DQo+PiArCWRlbF90aW1lcigmc3dkX3RpbWVyKTsNCj4+ICsJ
cmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgc3dkX29wZW4oc3RydWN0IGlu
b2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmZpbGUpDQo+PiArew0KPj4gKwlpZiAodGVzdF9hbmRf
c2V0X2JpdCgwLCAmc3dkX2lzX29wZW4pKQ0KPj4gKwkJcmV0dXJuIC1FQlVTWTsNCj4+ICsJc3dk
X3N0YXJ0KCk7DQo+PiArCXJldHVybiBzdHJlYW1fb3Blbihpbm9kZSwgZmlsZSk7DQo+PiArfQ0K
Pj4gKw0KPj4gK3N0YXRpYyBpbnQgc3dkX3JlbGVhc2Uoc3RydWN0IGlub2RlICppbm9kZSwgc3Ry
dWN0IGZpbGUgKmZpbGUpDQo+PiArew0KPj4gKwlpZiAoZXhwZWN0X2Nsb3NlICE9IDQyKSB7DQo+
PiArCQlzd2Rfc3RvcCgpOw0KPj4gKwkJY2xlYXJfYml0KDAsICZzd2RfaXNfb3Blbik7DQo+PiAr
CX0gZWxzZSB7DQo+PiArCQlwcl9jcml0KCJTV0QgZGV2aWNlIGNsb3NlZCB1bmV4cGVjdGVkbHku
ICBTV0Qgd2lsbCBub3Qgc3RvcCFcbiIpOw0KPj4gKwkJc3dkX3BpbmcoKTsNCj4+ICsJfQ0KPj4g
KwlleHBlY3RfY2xvc2UgPSAwOw0KPj4gKwlyZXR1cm4gMDsNCj4+ICt9DQo+PiArc3RhdGljIHNz
aXplX3Qgc3dkX3dyaXRlKHN0cnVjdCBmaWxlICpmaWxlLCBjb25zdCBjaGFyIF9fdXNlciAqYnVm
LA0KPj4gKwkJCQkJCXNpemVfdCBjb3VudCwgbG9mZl90ICpwcG9zKQ0KPj4gK3sNCj4+ICsJaWYg
KGNvdW50KSB7DQo+PiArCQlpZiAoIW5vd2F5b3V0KSB7DQo+PiArCQkJc2l6ZV90IGk7DQo+PiAr
DQo+PiArCQkJZXhwZWN0X2Nsb3NlID0gMDsNCj4+ICsJCQlmb3IgKGkgPSAwOyBpICE9IGNvdW50
OyBpKyspIHsNCj4+ICsJCQkJY2hhciBjOw0KPj4gKw0KPj4gKwkJCQlpZiAoZ2V0X3VzZXIoYywg
YnVmICsgaSkpDQo+PiArCQkJCQlyZXR1cm4gLUVGQVVMVDsNCj4+ICsJCQkJaWYgKGMgPT0gJ1Yn
KQ0KPj4gKwkJCQkJZXhwZWN0X2Nsb3NlID0gNDI7DQo+PiArCQkJfQ0KPj4gKwkJfQ0KPj4gKwkJ
c3dkX3BpbmcoKTsNCj4+ICsJfQ0KPj4gKwlyZXR1cm4gY291bnQ7DQo+PiArfQ0KPj4gKw0KPj4g
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIHN3ZF9mb3BzID0gew0KPj4gKwku
b3duZXIJCT0gVEhJU19NT0RVTEUsDQo+PiArCS5sbHNlZWsJCT0gbm9fbGxzZWVrLA0KPj4gKwkg
LndyaXRlCQk9IHN3ZF93cml0ZSwNCj4+ICsJLnVubG9ja2VkX2lvY3RsCT0gc3dkX2lvY3RsLA0K
Pj4gKwkuY29tcGF0X2lvY3RsCT0gY29tcGF0X3B0cl9pb2N0bCwNCj4+ICsJLm9wZW4JCT0gc3dk
X29wZW4sDQo+PiArCS5yZWxlYXNlCT0gc3dkX3JlbGVhc2UsDQo+PiArfTsNCj4+ICsNCj4+ICtz
dGF0aWMgc3RydWN0IG1pc2NkZXZpY2Ugc3dkX21pc2NkZXYgPSB7DQo+PiArCS5taW5vcgk9CVdB
VENIRE9HX01JTk9SLA0KPj4gKwkubmFtZQk9CSJzb2Z0LXdhdGNoZG9nIiwNCj4+ICsJLmZvcHMJ
PQkmc3dkX2ZvcHMsDQo+PiArfTsNCj4+ICsNCj4+ICtpbnQgX19pbml0IHN3ZF9yZWdpc3Rlcih2
b2lkKQ0KPj4gK3sNCj4+ICsJaW50IHJldDsNCj4+ICsNCj4+ICsJcHJfaW5mbygic3dkIGluc3Rh
bGxlZCB3aXRoIHRpbWVyIik7DQo+PiArCXJldCA9IG1pc2NfcmVnaXN0ZXIoJnN3ZF9taXNjZGV2
KTsNCj4+ICsJdGltZXJfc2V0dXAoJnN3ZF90aW1lciwgc3dkX3RpbWVyX2Z1bmMsIDApOw0KPj4g
KwlyZXR1cm4gMDsNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGludCBfX2luaXQgc3dkX2luaXQo
dm9pZCkNCj4+ICt7DQo+PiArCXJldHVybiAwOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9p
ZCBfX2V4aXQgc3dkX3VubG9hZCh2b2lkKQ0KPj4gK3sNCj4+ICsJcmV0dXJuOw0KPj4gK30NCj4+
ICsNCj4+ICtzdWJzeXNfaW5pdGNhbGwoc3dkX3JlZ2lzdGVyKTsNCj4+ICsNCj4+ICttb2R1bGVf
aW5pdChzd2RfaW5pdCk7DQo+PiArbW9kdWxlX2V4aXQoc3dkX3VubG9hZCk7DQo+PiArDQo+PiAr
TU9EVUxFX0FVVEhPUigiUGV0ZXIgRW5kZXJib3JnIik7DQo+PiArTU9EVUxFX0RFU0NSSVBUSU9O
KCJNZW1vcnkgc29mdHdhcmUgd2F0Y2hkb2ciKTsNCj4+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7
DQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xpbnV4L3dhdGNoZG9nLmggYi9pbmNsdWRl
L3VhcGkvbGludXgvd2F0Y2hkb2cuaA0KPj4gaW5kZXggYjE1Y2RlNWM5MDU0Li43ODA5ODc0ODJl
MmQgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvd2F0Y2hkb2cuaA0KPj4gKysr
IGIvaW5jbHVkZS91YXBpL2xpbnV4L3dhdGNoZG9nLmgNCj4+IEBAIC00OCw2ICs0OCwxMiBAQCBz
dHJ1Y3Qgd2F0Y2hkb2dfaW5mbyB7DQo+PiAgI2RlZmluZQlXRElPRl9QUkVUSU1FT1VUCTB4MDIw
MCAgLyogUHJldGltZW91dCAoaW4gc2Vjb25kcyksIGdldC9zZXQgKi8NCj4+ICAjZGVmaW5lCVdE
SU9GX0FMQVJNT05MWQkJMHgwNDAwCS8qIFdhdGNoZG9nIHRyaWdnZXJzIGEgbWFuYWdlbWVudCBv
cg0KPj4gIAkJCQkJICAgb3RoZXIgZXh0ZXJuYWwgYWxhcm0gbm90IGEgcmVib290ICovDQo+PiAr
I2RlZmluZSBXRElPRl9PT01LSUxMCQkweDA4MDAJLyogV2F0Y2hkb2cgdHJpZ2dlciBwcm9jZXNz
IGtpbGwgYXMNCj4+ICsJCQkJCSAqICBvb20ga2lsbA0KPj4gKwkJCQkJICovDQo+PiArI2RlZmlu
ZSBXRElPRl9BVVRPS0lMTAkJMHgxMDAwCS8qIFdhdGNoZG9nIGxpc3RlbiB0byBvb20gbm90aWZp
eQ0KPj4gKwkJCQkJICogYW5kIGtpbGxzIHdpdGggaXRzIHBvbGljeQ0KPj4gKwkJCQkJICovDQo+
PiAgI2RlZmluZQlXRElPRl9LRUVQQUxJVkVQSU5HCTB4ODAwMAkvKiBLZWVwIGFsaXZlIHBpbmcg
cmVwbHkgKi8NCj4+ICANCj4+ICAjZGVmaW5lCVdESU9TX0RJU0FCTEVDQVJECTB4MDAwMQkvKiBU
dXJuIG9mZiB0aGUgd2F0Y2hkb2cgdGltZXIgKi8NCj4+IGRpZmYgLS1naXQgYS9tbS9vb21fa2ls
bC5jIGIvbW0vb29tX2tpbGwuYw0KPj4gaW5kZXggZmExY2YxOGJhYzk3Li5hNWY3Mjk5YWY5YTMg
MTAwNjQ0DQo+PiAtLS0gYS9tbS9vb21fa2lsbC5jDQo+PiArKysgYi9tbS9vb21fa2lsbC5jDQo+
PiBAQCAtNjU4LDcgKzY1OCw3IEBAIHN0YXRpYyBpbnQgb29tX3JlYXBlcih2b2lkICp1bnVzZWQp
DQo+PiAgCXJldHVybiAwOw0KPj4gIH0NCj4+ICANCj4+IC1zdGF0aWMgdm9pZCB3YWtlX29vbV9y
ZWFwZXIoc3RydWN0IHRhc2tfc3RydWN0ICp0c2spDQo+PiArdm9pZCB3YWtlX29vbV9yZWFwZXIo
c3RydWN0IHRhc2tfc3RydWN0ICp0c2spDQo+PiAgew0KPj4gIAkvKiBtbSBpcyBhbHJlYWR5IHF1
ZXVlZD8gKi8NCj4+ICAJaWYgKHRlc3RfYW5kX3NldF9iaXQoTU1GX09PTV9SRUFQX1FVRVVFRCwg
JnRzay0+c2lnbmFsLT5vb21fbW0tPmZsYWdzKSkNCj4+IEBAIC04NTYsNyArODU2LDcgQEAgc3Rh
dGljIGJvb2wgdGFza193aWxsX2ZyZWVfbWVtKHN0cnVjdCB0YXNrX3N0cnVjdCAqdGFzaykNCj4+
ICAJcmV0dXJuIHJldDsNCj4+ICB9DQo+PiAgDQo+PiAtc3RhdGljIHZvaWQgX19vb21fa2lsbF9w
cm9jZXNzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdmljdGltLCBjb25zdCBjaGFyICptZXNzYWdlKQ0K
Pj4gK3ZvaWQgX19vb21fa2lsbF9wcm9jZXNzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdmljdGltLCBj
b25zdCBjaGFyICptZXNzYWdlKQ0KPj4gIHsNCj4+ICAJc3RydWN0IHRhc2tfc3RydWN0ICpwOw0K
Pj4gIAlzdHJ1Y3QgbW1fc3RydWN0ICptbTsNCj4+DQo=

Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 589994011F3
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Sep 2021 00:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238231AbhIEWXt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 5 Sep 2021 18:23:49 -0400
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:55532 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232617AbhIEWXs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 5 Sep 2021 18:23:48 -0400
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 185MF2uh027978;
        Sun, 5 Sep 2021 22:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=cb1dIap/vPPu8UjxP2zz13wPOn4yvA2S+fyvJJa+IQ0=;
 b=JeaeoejgJLzO+qvhKw1zhHP0Jx64PvOgC13vzS0PgH1RBPbHHofvBVl0UEBHLQOvC9LK
 iIXu2a8V2ETNu5LStbBrsFl9Ce4iYWBHPAVRvCTGI0Qt5ix2uZ+6kHZV6+fBCKHZDY56
 oppVmIpnj4MO8EDKT3DEjDj/NeN3dJngIytSqYqIanLFFO6XGxyWVVm666jzEdJ+g78B
 IIZe2rWh7Nk7Pnu70oVCpD5DE5BfyIJMNnwAxxhpm3WRy+YRR5tdTZAStjaHoTHoI88t
 HsRYFFUJ4/CvVJoS2IcKKqiUs1ekubIbKLvPYfaUA+D0mfI25gG3jSxUeM1g/9zTPeEL Fw== 
Received: from g9t5009.houston.hpe.com (g9t5009.houston.hpe.com [15.241.48.73])
        by mx0b-002e3701.pphosted.com with ESMTP id 3av1f88kax-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 05 Sep 2021 22:22:30 +0000
Received: from G4W9120.americas.hpqcorp.net (exchangepmrr1.us.hpecorp.net [16.210.21.15])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by g9t5009.houston.hpe.com (Postfix) with ESMTPS id 54CE351;
        Sun,  5 Sep 2021 22:22:29 +0000 (UTC)
Received: from G9W8453.americas.hpqcorp.net (2002:10d8:a0d3::10d8:a0d3) by
 G4W9120.americas.hpqcorp.net (2002:10d2:150f::10d2:150f) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Sun, 5 Sep 2021 22:22:28 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (15.241.52.10) by
 G9W8453.americas.hpqcorp.net (16.216.160.211) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18 via Frontend Transport; Sun, 5 Sep 2021 22:22:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+owjg0NPwGDccfprVMZi/O3r2WHlxadMRB7fTAh/BEaWQ3crDAWRJ7JQUryqR65lueQeFoI8yKvBqlktanAR4qQOxESF3F7CNfN46T1Mp2C9mesM0bC27tVVsEZ37npYV2XXC/OUeoldxGCb8RY1v9yYhOCqcJqy8pXTCZL0UBxionUl2uaBt/Pnd7Y+qS0Wndv6M8kJc1zgNkLaiRxYSX3hXIZ6k3ZoEzich74krWHIn2zwU1zxeOaDvm+fRNN0BO5Nc3UtQfrXrESR1ZEa2lLDR55s+o504T4d0sQ4sqn4ScWt3wgFVbjCrYOflSmfTAL+abs0i+9CoeiLclSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=cb1dIap/vPPu8UjxP2zz13wPOn4yvA2S+fyvJJa+IQ0=;
 b=Td7vKpH6JUOsN2T7KcZg0znsS0aX6hoHvKGPAMNcamPe5t+gY/VP3/eyudfijqERg2I0QOi6qDoFETXkr9skZ67E7it3ff/h06ky/JJ3bm4n1cyEtDPIyDKhpiNkriu2X6e4l9OL6It8UpcDYGDdYAOnOMtX39Y+fD0N74D8qbbqdRdp+C+SOaEqDwcPhEPSirBlASV/YLtZ70N/VepL/nf0eXRMHrDFJsm3g4+gW7lYvgT9sPQ/LF1gklFUFDWoX2P+gDvTQ9pAZ1j5lhiE+im3oui0q177hrihr4xYCuMjBVvgPENAFkbeP2ca47ogHi2cXip+SSIsW505qF4oHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from CS1PR8401MB1270.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7515::7) by CS1PR8401MB1269.NAMPRD84.PROD.OUTLOOK.COM
 (2a01:111:e400:7514::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Sun, 5 Sep
 2021 22:22:27 +0000
Received: from CS1PR8401MB1270.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::ccba:4f72:5707:1b3b]) by CS1PR8401MB1270.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::ccba:4f72:5707:1b3b%5]) with mapi id 15.20.4478.025; Sun, 5 Sep 2021
 22:22:27 +0000
From:   "Klein, Curtis" <curtis.klein@hpe.com>
To:     Jiri Slaby <jirislaby@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
Subject: RE: was [Re: [PATCH v3] watchdog: Add hrtimer-based pretimeout
 feature]
Thread-Topic: was [Re: [PATCH v3] watchdog: Add hrtimer-based pretimeout
 feature]
Thread-Index: AQHXoWU/RR9zH2V8RkSb2cbKKdM106uTiDUAgAI5xeA=
Date:   Sun, 5 Sep 2021 22:22:26 +0000
Message-ID: <CS1PR8401MB1270909863CE345530C9FFFB89D19@CS1PR8401MB1270.NAMPRD84.PROD.OUTLOOK.COM>
References: <1612383090-27110-1-git-send-email-curtis.klein@hpe.com>
 <67d601c9-8f95-cb10-40df-4d962ec6f9ba@kernel.org>
 <7fdd262e-84fb-0c34-baa9-162130f1e109@roeck-us.net>
 <85ce6068-c98e-dbe0-a4b6-5c877b460f64@kernel.org>
 <54d77fb1-2531-c6ed-738e-9f661443b097@kernel.org>
In-Reply-To: <54d77fb1-2531-c6ed-738e-9f661443b097@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=hpe.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27a4542f-58f1-4a58-8481-08d970bba47f
x-ms-traffictypediagnostic: CS1PR8401MB1269:
x-microsoft-antispam-prvs: <CS1PR8401MB1269938F390F09FBE953458689D19@CS1PR8401MB1269.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0dqHVNdijCZHrcfGmcap8hStO1eTJNf+0dAEqed+hcmTvOe/dutPBabTLZTg+coAmp0Mi6YSPYMLbHpZSMrD8S8TPkmaNxCibB7UvwbmzZ1KIE/Dne+gpqXbbaSH8LqzNyZxh8cFNxPw/T2iCU1Qe26XSWVggbfm+Pps5W3a++cd7hiQzkjzgf5O+QoIiQXzp7Ib/pLGVp+BoeXuYdult33z0Tsejav/xpY0ldGvevWEWem6/hJriesVEikUpvNA3oJJbL1UfXuuQ6tLewpQtlTI9g5C1KuZP+/dQ+VSyrSSkkWklH8/WZN8PjFjASmLiokEh3EtGGc3YyyQ0koF5NpCmvkKgPwt3NIX7JBLl7/d+2F1Vty8tfnnEnaH8ANBfLRQ0reclIbybwzWbqzmSGADCCarOKx9vPYDxuHS3M8U3GF10KyjHR4XDrOEnTJqWXve5jwf8g8Rn8+fvmqn1Sv9woH00XRIfUlsLdlsptaZBd3u3mn1inx2nKZ+xptF5Bs+PUTIBXM5mt0CPrXXfuc5zdNQ7xxbXhDsmbISf60vdf691V96ALgcMtTxWBpXPpyMnd91YK8SYRjMUNZyzahvMoKt3xgMAJJVA1CqZlFCyNktqiW0yQKB2cxn1dh+pyuM5jGGHCWC0UWWf55fh/OkDSHz3a7GQ++FA6qT1BMfrWvrbj9jiyF5sXVl07QtcaVvwDagWCY1R2iXcp1qnA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CS1PR8401MB1270.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(396003)(39860400002)(346002)(376002)(366004)(136003)(38100700002)(33656002)(66946007)(122000001)(71200400001)(5660300002)(38070700005)(7696005)(83380400001)(76116006)(64756008)(186003)(478600001)(86362001)(6506007)(66556008)(66476007)(66446008)(4326008)(110136005)(55016002)(2906002)(316002)(8676002)(8936002)(52536014)(9686003)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2JvVXM1ck5YSHE3Q01xaTZ1VXd5VDg4Y0VxQ1dQKzY5dEN2Q3ZML2l3cFlz?=
 =?utf-8?B?UVBjbVAvemdnbDZBN1ZKSk1zYkdpMGZPdVpaUnJPdW84aWZUTHBqZzJ0K1Fq?=
 =?utf-8?B?eUdzcUNYZWRvT2NjTVQ5NlRsZXVCTDlxTHc3OVlZb1ZUS3d6N1hmS3hlR2Y2?=
 =?utf-8?B?YnlJWlVHVGlrdk16MmliOG5kMVB0Vm1tRlJzQXdtOENtR21ZRlRIZmNPWGo0?=
 =?utf-8?B?UXlDU25pR21NWmVWOUZ1MEx4clQyWmQvOCtSbVdNOGhwWE53NGtQQ0NkVXky?=
 =?utf-8?B?RGhOdzd4dW1md0VIeXhKK2hDU0tDbVdvbmdML1IxUCsyZnJDdmp2MWIvNG5T?=
 =?utf-8?B?MUE5aFNpVE1Zd2IvNkNSOC94UVhEcXFCZjZZaFFIRzYzY0QyZld1enlHeFJH?=
 =?utf-8?B?UnY5ZjRTcWlLM2t3cG4xalZXL3dhaEhJNUJhY2p2M1c0bDBvaVlJYmRUTUU3?=
 =?utf-8?B?VFo2L3hDSmMvWFFJR2x5bmFhUlZsazZEc0tFR2pWekFiWGcrYkVMVEtkYVBv?=
 =?utf-8?B?UDdSQ3BqMzVKVXgyaUlZSDZIdGVGUlRHUUpMbHpTUG5iSUNjTVNHOXdFc2x0?=
 =?utf-8?B?NGNiRURKOEY3QjlGK3cybVFHSXM3STNFZWVreWxCdG13Z29YL2M4dnFxNFZm?=
 =?utf-8?B?TTBWZHBDS0ZMTFRwMTJiNTFHN0ErSjM2d2tIaU42YTZqcWpVZFNKbjZJTE1K?=
 =?utf-8?B?Y0RTL210a0hSWXdCcWtkZVdrZXdKc0VtQjhkQkhTMCtqS2UwZkhoZ3hkOFM0?=
 =?utf-8?B?OGJBNEgwUmp2NDlmWTY2UWRnckVJcURvM1dnNEc0ZXpCcjltcWoxUHR4eGtO?=
 =?utf-8?B?dGR0TVRFV1pOTWZQVFBkYVNWRnBjbDlaaFVaOVFoOUh4Z29RdmpiTFpvb3Vk?=
 =?utf-8?B?V2gvNkxZYXRBazB0d1ZHTGVwSGl1SGU2VDVKcU9qQ3I4WURRZlFtcGNKWGJv?=
 =?utf-8?B?eEdMUXRsQnp0NFZRQXhLa2MyS3FPdHRwb1hyenRBeUF5cEQwL3FUeWoxLzUz?=
 =?utf-8?B?ZlhSQTlXZ1lNM3FLZWh5RWtDc3VFU3ZIb3RWVnZrblhzTkNXZm40eUpQS0dY?=
 =?utf-8?B?Q24xYTF4WjBiMTdyVXdscThwd3RVMlhIZWdRcnBWT1hZWmEzdEJXaElZODlR?=
 =?utf-8?B?aFg2Qmh1NW9IdU5hczJQOVJtOUkrYytBY2orclpCY0tyV29qRC81YytKdDVn?=
 =?utf-8?B?cTVDd1NJOHhvejkxVHR4ejZPbHM5OUFjTFBmd2NNNlNsdzNIQmFLTGtacjla?=
 =?utf-8?B?ZmduMkp2MUp0alpXMHBWdzNDeEwydC9pdHZpMzAxU3IwSHEvMWw2dVhDYitB?=
 =?utf-8?B?S3AwMkRDZWM2eHBrUmFHcVFvMUhJK3FZQ2Q0Ynk4R1BjMjFNK0VUMmEray9q?=
 =?utf-8?B?elhCcnJzSzJwYXU0K0lrbGFodlg5ZHhPMjNuMFlOaWkyUUlubzBlczJuMjZr?=
 =?utf-8?B?SklRSFZWSWZzZEgxMkhVODFSUVhMSWNaV1FEVG5SbmdwMjlpSDJZbDdLQ2xG?=
 =?utf-8?B?elFMMnR4Tlp1aXNJb0Y3OEtNRzlSN0pXcTdlYnVCbUg5R0RFZzZFeTFYeDFh?=
 =?utf-8?B?RndEK2JiMm40RTRmaXZjb1NIL1pKVkprMTZNd3pRM0hZR0dnM1Nlam5hWlpX?=
 =?utf-8?B?blBqU1VmOEI1M2c5TVZqVmFIV1lFalh5djlLNnFoSVFqYmx2M2dMUVlZUWFp?=
 =?utf-8?B?R3JPNnNuRGFNSmlEYjJKWHdxb21iWm15SUwxYldMTEtYWUlwMFFvWTJDL04w?=
 =?utf-8?B?RkRVRHArVXRNcGwwalhxNFAwb1BSY01rd2ZhT2xWWW0xRUZ5RGttaGVBTGhy?=
 =?utf-8?B?ODJBY3drcllOUGZEb1FOOFJJbm96emhVNnN2SVBUOG1XZVNKSkZGQ1dKM1VB?=
 =?utf-8?Q?V94rCmABbJE1c?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CS1PR8401MB1270.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 27a4542f-58f1-4a58-8481-08d970bba47f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2021 22:22:26.8992
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRxe91xZb0q0FMF1TlaH+tTkdDs0B1WkMb18ImkyuPRE8gidigj87HKawGvLPLHwK7c0rYdqLezdrLyQ1DeajA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CS1PR8401MB1269
X-OriginatorOrg: hpe.com
X-Proofpoint-ORIG-GUID: zfrR5IuAg_gZHdcE_ZLMD39GCrT632G8
X-Proofpoint-GUID: zfrR5IuAg_gZHdcE_ZLMD39GCrT632G8
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-09-05_04:2021-09-03,2021-09-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 clxscore=1011 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109050157
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gOS80LzIxLCAxOjE5QU0sIEppcmkgU2xhYnkgd3JvdGU6DQo+IE9uIDA0LiAwOS4gMjEsIDEw
OjE2LCBKaXJpIFNsYWJ5IHdyb3RlOg0KPiA+IE9uIDAyLiAwOS4gMjEsIDE2OjA1LCBHdWVudGVy
IFJvZWNrIHdyb3RlOg0KPiA+PiBPbiA5LzEvMjEgMTE6NTUgUE0sIEppcmkgU2xhYnkgd3JvdGU6
DQo+ID4+PiBPbiAwMy4gMDIuIDIxLCAyMToxMSwgQ3VydGlzIEtsZWluIHdyb3RlOg0KPiA+Pj4+
IFRoaXMgYWRkcyB0aGUgb3B0aW9uIHRvIHVzZSBhIGhydGltZXIgdG8gZ2VuZXJhdGUgYSB3YXRj
aGRvZyBwcmV0aW1lb3V0DQo+ID4+Pj4gZXZlbnQgZm9yIGhhcmR3YXJlIHdhdGNoZG9ncyB0aGF0
IGRvIG5vdCBuYXRpdmVseSBzdXBwb3J0IHdhdGNoZG9nDQo+ID4+Pj4gcHJldGltZW91dHMuDQo+
ID4+Pj4NCj4gPj4+PiBXaXRoIHRoaXMgZW5hYmxlZCwgYWxsIHdhdGNoZG9ncyB3aWxsIGFwcGVh
ciB0byBoYXZlIHByZXRpbWVvdXQgc3VwcG9ydA0KPiA+Pj4+IGluIHVzZXJzcGFjZS4gSWYgbm8g
cHJldGltZW91dCB2YWx1ZSBpcyBzZXQsIHRoZXJlIHdpbGwgYmUgbm8gY2hhbmdlIGluDQo+ID4+
Pj4gdGhlIHdhdGNoZG9nJ3MgYmVoYXZpb3IuDQo+ID4+Pg0KPiA+Pj4gSGksDQo+ID4+Pg0KPiA+
Pj4gb24gbXkgRGVsbCBMYXRpdHVkZSA3MjgwLCBDT05GSUdfV0FUQ0hET0dfSFJUSU1FUl9QUkVU
SU1FT1VUPXkgY2F1c2VzDQo+ID4+PiBhbGwgcmVib290LCBrZXhlYywgc3VzcGVuZCB0byBwYW5p
Yy4gRGlzYWJsaW5nIHRoYXQgb3B0aW9uIG1ha2VzIGl0DQo+ID4+PiBhbGwgd29yayBhZ2Fpbi4g
UHJvdmlkZWQgaXQgaGFwcGVucyB2ZXJ5IGxhdGUgaW4gdGhlIHByb2Nlc3MsIEkgZG9uJ3QNCj4g
Pj4+IGtub3cgaG93IHRvIGdyYWIgc29tZSBsb2dzLi4uDQo+ID4+Pg0KPiA+Pj4gQW55IGlkZWFz
Pw0KPiA+Pj4NCj4gPj4NCj4gPj4gQUZBSUNTIHRoZSB0aW1lciBkb2VzIG5vdCBzdG9wIG9uIHJl
Ym9vdC4gSSB0aGluayB3ZSdsbCBuZWVkIHRvDQo+ID4+IGF1Z21lbnQgdGhlIGNvZGUNCj4gPj4g
dG8gZG8gdGhhdC4NCj4gPg0KPiA+IE5vLCBpdCBpcyBzdG9wcGVkIHZpYSBkZXZpY2UgdW5yZWdp
c3RlciAtPiB3YXRjaGRvZ19kZXZfdW5yZWdpc3RlciAtPg0KPiA+IHdhdGNoZG9nX2NkZXZfdW5y
ZWdpc3RlciAtPiB3YXRjaGRvZ19ocnRpbWVyX3ByZXRpbWVvdXRfc3RvcC4NCj4gPg0KPiA+IEJ1
dCBsb29rOg0KPiA+IHdhdGNoZG9nX2NkZXZfdW5yZWdpc3Rlcg0KPiA+ICDCoCAtPiB3ZGQtPndk
X2RhdGEgPSBOVUxMOw0KPiA+ICDCoCAtPiB3YXRjaGRvZ19ocnRpbWVyX3ByZXRpbWVvdXRfc3Rv
cA0KPiA+ICDCoMKgwqAgLT4gaHJ0aW1lcl9jYW5jZWwoJndkZC0+d2RfZGF0YS0+cHJldGltZW91
dF90aW1lcik7DQo+ID4NCj4gPiBUaGUgZGlmZiBiZWxvdyBvYnZpb3VzbHkgZml4ZXMgdGhlIGlz
c3VlLA0KPiANCj4gV2hpY2ggaXMgZXhhY3RseSBhIC1uZXh0IGNvbW1pdDoNCj4gY29tbWl0IGM3
YjE3OGRhZTEzOWY4ODU3ZWRjNTA4ODhjZmJmMjUxY2Q5NzRhMzgNCj4gQXV0aG9yOiBDdXJ0aXMg
S2xlaW4gPGN1cnRpcy5rbGVpbkBocGUuY29tPg0KPiBEYXRlOiAgIFR1ZSBKdW4gMjIgMjM6MjY6
MjMgMjAyMSAtMDcwMA0KPiANCj4gICAgICB3YXRjaGRvZzogRml4IE5VTEwgcG9pbnRlciBkZXJl
ZmVyZW5jZSB3aGVuIHJlbGVhc2luZyBjZGV2DQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvd2F0Y2hk
b2cvd2F0Y2hkb2dfZGV2LmMNCj4gPiArKysgYi9kcml2ZXJzL3dhdGNoZG9nL3dhdGNoZG9nX2Rl
di5jDQo+ID4gQEAgLTEwOTYsNiArMTA5Niw4IEBAIHN0YXRpYyB2b2lkIHdhdGNoZG9nX2NkZXZf
dW5yZWdpc3RlcihzdHJ1Y3QNCj4gPiB3YXRjaGRvZ19kZXZpY2UgKndkZCkNCj4gPiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHdhdGNoZG9nX3N0b3Aod2RkKTsNCj4gPiAgwqDCoMKg
wqDCoMKgwqAgfQ0KPiA+DQo+ID4gK8KgwqDCoMKgwqDCoCB3YXRjaGRvZ19ocnRpbWVyX3ByZXRp
bWVvdXRfc3RvcCh3ZGQpOw0KPiA+ICsNCj4gPiAgwqDCoMKgwqDCoMKgwqAgbXV0ZXhfbG9jaygm
d2RfZGF0YS0+bG9jayk7DQo+ID4gIMKgwqDCoMKgwqDCoMKgIHdkX2RhdGEtPndkZCA9IE5VTEw7
DQo+ID4gIMKgwqDCoMKgwqDCoMKgIHdkZC0+d2RfZGF0YSA9IE5VTEw7DQo+ID4gQEAgLTExMDMs
NyArMTEwNSw2IEBAIHN0YXRpYyB2b2lkIHdhdGNoZG9nX2NkZXZfdW5yZWdpc3RlcihzdHJ1Y3QN
Cj4gPiB3YXRjaGRvZ19kZXZpY2UgKndkZCkNCj4gPg0KPiA+ICDCoMKgwqDCoMKgwqDCoCBocnRp
bWVyX2NhbmNlbCgmd2RfZGF0YS0+dGltZXIpOw0KPiA+ICDCoMKgwqDCoMKgwqDCoCBrdGhyZWFk
X2NhbmNlbF93b3JrX3N5bmMoJndkX2RhdGEtPndvcmspOw0KPiA+IC3CoMKgwqDCoMKgwqAgd2F0
Y2hkb2dfaHJ0aW1lcl9wcmV0aW1lb3V0X3N0b3Aod2RkKTsNCj4gPg0KPiA+ICDCoMKgwqDCoMKg
wqDCoCBwdXRfZGV2aWNlKCZ3ZF9kYXRhLT5kZXYpOw0KPiA+ICDCoH0NCj4gPg0KPiA+IHRoYW5r
cywNCj4gDQo+IA0KPiAtLQ0KPiBqcw0KPiBzdXNlIGxhYnMNCg0KRG9lcyBpdCBzdGlsbCBtYWtl
IHNlbnNlIHRvIHN0b3AgdGhlIHRpbWVyIG9uIHJlYm9vdCBvciBzdXNwZW5kPw0KDQpJIGhhdmVu
J3QgaGFkIGFueSBwcm9ibGVtcyB3aXRoIHJlYm9vdGluZyBidXQgSSBoYXZlbid0IGJlZW4gYWJs
ZSB0byB0ZXN0DQpzdXNwZW5kaW5nLg0KDQotQ3VydGlzDQo=

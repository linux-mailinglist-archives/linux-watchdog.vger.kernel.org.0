Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C948522E59
	for <lists+linux-watchdog@lfdr.de>; Wed, 11 May 2022 10:28:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243659AbiEKI2o (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 11 May 2022 04:28:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235731AbiEKI2l (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 11 May 2022 04:28:41 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2090.outbound.protection.outlook.com [40.107.113.90])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04297170F33;
        Wed, 11 May 2022 01:28:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgeqTVPCCyNt8HE09K+l4wGaziyTFzJY0udY4nz9a4JGhj9IWdjkqdYz1LQUNHvAI/8m4KkSMj0lldgJi1aujm4rj3k4t9V2Yk5Zd9Ttdh0PDsGlEjerY+J7TU0bsvRL4nvS3fEiP3r2ifQvGL+tNusIH3oybxe9FoWa83HhgrLKhO7lO0fdIDZS3oLz5sPRAC53CWGzD8Df2JMJY3e6H5bxjXAMJmjTD5m1CZlhw+XgZG99J9asojBqHxmZePI56P7GjZ1tfriUuY4QTRHbKsi/hhn760DzbDRumqyydZ/+kiDdZfOPYK7jN9WyR2owwlIur5zVTtVGng2MwpEesQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZT5VMGF3XtpdMqzhAdXGqRLfPk66wbslbFBYQ5K8d7w=;
 b=Hq7+kIoyvMUCjHVRBqZvYa47pU5PRYmsQfE/9VRFMLQxlAo+kyb5cfTpEKJeopAT9FNU+P2L/wpJUs+a21LOQnHVZPI3cTYKB0Rxso6YyTN3d3rM1+RF/5Ida1XYPzdDdRk0mHiYQV5LZoGsHS+iQ1EEtVuVholiqhQPRzPtn++YB3uaBqgw8CiOn7I4Zjvdz4VOKRxLwqXBEeg69r/xTxH8DI8RqU9ujxBDWqoJuW76btipfKPKdyqgxx8OsAJlDnlJheCh5Vj8zCVLy7U5Advul3IyTQNw7aitqLh5eotovo/pnxWmYpx4vrZHTmYDOWWb0p0oiks+17rQ4rp5TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZT5VMGF3XtpdMqzhAdXGqRLfPk66wbslbFBYQ5K8d7w=;
 b=Ia6eIkFO7wHS+wyfdFFdcP4VuqQsIsyBQ02ZL62vWZ6KDkUZzjrOEhyOXMfTOj6HkMcd9r/zbLkvZO+5dbpy7A2Hmfte+1Pv3tGjAw+au7SWgSArnTpQkHO3pRwBaHddxvjadSx+EFhgRQaN8XRJ11XrwoYVhgi3Y+UKbZY7ZnA=
Received: from OSAPR01MB5060.jpnprd01.prod.outlook.com (2603:1096:604:6e::17)
 by OSBPR01MB2918.jpnprd01.prod.outlook.com (2603:1096:604:1c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Wed, 11 May
 2022 08:28:36 +0000
Received: from OSAPR01MB5060.jpnprd01.prod.outlook.com
 ([fe80::15ba:6d34:ba18:2a8a]) by OSAPR01MB5060.jpnprd01.prod.outlook.com
 ([fe80::15ba:6d34:ba18:2a8a%5]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 08:28:36 +0000
From:   DLG Adam Thomson <DLG-Adam.Thomson.Opensource@dm.renesas.com>
To:     Primoz Fiser <primoz.fiser@norik.com>,
        DLG Adam Thomson <DLG-Adam.Thomson.Opensource@dm.renesas.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Support Opensource <Support.Opensource@diasemi.com>
CC:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andrej Picej <andrej.picej@norik.com>,
        "upstream@phytec.de" <upstream@phytec.de>
Subject: RE: [PATCH 1/3] dt-bindings: mfd: da9063: watchdog: add suspend
 disable option
Thread-Topic: [PATCH 1/3] dt-bindings: mfd: da9063: watchdog: add suspend
 disable option
Thread-Index: AQHYVhpl7+C9Xwxcl0muoNJvAIXTxK0WVvFwgAMZ2gCAAARbwA==
Date:   Wed, 11 May 2022 08:28:35 +0000
Message-ID: <OSAPR01MB50605A5F3F9B93FDE0B043CAB0C89@OSAPR01MB5060.jpnprd01.prod.outlook.com>
References: <20220422072713.3172345-1-primoz.fiser@norik.com>
 <OSAPR01MB5060A0D9B7EB66F108F34AFFB0C69@OSAPR01MB5060.jpnprd01.prod.outlook.com>
 <cb5b07ea-1c09-1dcb-a4a9-12276647d634@norik.com>
In-Reply-To: <cb5b07ea-1c09-1dcb-a4a9-12276647d634@norik.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96b337d3-4fbf-4d0d-955a-08da33283e1b
x-ms-traffictypediagnostic: OSBPR01MB2918:EE_
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <OSBPR01MB291897BD20AE0FC227D91035C1C89@OSBPR01MB2918.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5ew33PvkHvlQ6/FApg5uJoXxlJ9Mj1xjj2jfQfuKICssuY0SCCMyVHpTvfvyStOszJnwVwesPIZBYCk9b+Vmswf5N37PWSKRkmc3Pq3S9Pk4qk1jJUpNKFsGU/26QQHfeMaY4ZAIkXjWmmb3SSqcmESZ2zmDu1++sPXMemsJcH/sWI4V7WU7kyghbJqIZPfrzzRldzeWmiATVN+kf02L031s/3m30wBh73PBbgYvfdveXONgw0M5o4ZOrQk1wIDR/sw0mDqWGim0vCqiMyN3vUxpF4kTQhJwPEBQl5SXhZpPlWtzeypSM9PzdWDX6SOpaNUX8KDltnKICtKqegHSfUfzHpH2mvczbmI0NYuWDNrxdHIUe70A0T0onjlf3wfCQx0CNiJ8y25A8Pu7tvJync6DdCoSqlmappvIqd2w4HLNAN5tejp1eU2g785GS6mXFJLBL8V6TEYkBjQ5nOvR5c0BiXQQiIUFzySI5Nx5cBicbJ4+n6BNcemON7PBOolndXp7Tj4B53YFv9+bmBiZJrlloGJ1rx2EwuEQFFdTbJYRViAqUW7UaQAJ9PH1iM/1ogWPOaICdwM3ROJw8CCcAWYazSk0aJw/EZ48aCistjOx26tjpouuDow189xssHpBWr5l+xNTQAPYQKNRkM8+s5wt/IHwudbi9XPQfhft7huWU7tqQM1a+e+RHMCHv6u/SR+eK10+vDiHrghh4QnQbA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB5060.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(64756008)(7416002)(5660300002)(186003)(33656002)(66446008)(83380400001)(15650500001)(66946007)(66476007)(76116006)(4326008)(8676002)(38070700005)(2906002)(66556008)(316002)(52536014)(8936002)(71200400001)(122000001)(508600001)(26005)(9686003)(7696005)(53546011)(6506007)(54906003)(110136005)(38100700002)(55016003)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wk9mUUorQ1pqVnlaaVJLSGZBNEN0M1ZDNXVQcXozcjNoL0FmeXZxRXVDWXJG?=
 =?utf-8?B?bS96NDk0ZDN2bUlpL2xRbDNPS3RiMzFySjMxakdSYS9vaXoybThnWnFXUHpa?=
 =?utf-8?B?WXIyb3V3ejkyR0Z4QzJQeG54YnBRczBJc3NLR3FBNTJkakQ4bW0yTXRQZkxz?=
 =?utf-8?B?b2ZCTkZIMGdsTU94QXJDd05xSUQveFJUN013dkZmVk50NnF4OE1xRmY5MU9R?=
 =?utf-8?B?K1h2a09FNE5mSEVyampZUHg4VXJaZ2NWMW9JMVYyd3hOU1lZTmdjZTBtUUtx?=
 =?utf-8?B?bHRtNjhSOUtzWmxJbUhCbk50b1FPOVV0bnNHRW4rSDRGaVFvWUlicC9UWDhm?=
 =?utf-8?B?YVV6NlM4dTFZcnlBNXVPVWhWL2U3YmhTTlJUT1pBaXBRNHl0em5BRU5hSTJS?=
 =?utf-8?B?a3lmK2trMXU0MGF1UStJYUIrVGUzSWYxVW1USTV3cnFUcXArNHJpd1FWRlRk?=
 =?utf-8?B?YXhoUHhjVUMxdldwRDJnNHdWckJIczFCalZ5S2FZWEtyZDdnVS91UUQxN2ZJ?=
 =?utf-8?B?ZlBrL01FQnQvVE9hUGZ6R1QzdWRkS3dWZHhRRGNWSzJZMTllNHgyeEVId1JM?=
 =?utf-8?B?bDhQN3Y4TXVZZWxUNFJkcVlUbTkxcjE4YUVFNXFkOTArMUpuVnFOdFpiRkRY?=
 =?utf-8?B?U2J6OVBDc21VNUwwTGlnN0pqMnU5WUJNT3R2eFhxMTIvSStlOHVvalgwcnh5?=
 =?utf-8?B?VWo2bE10NG5yYXBCcGk4Z29MekdjSTRMN0Npd0Y5dDVWaEtPZS9sS21GbGxI?=
 =?utf-8?B?Y090NmN5Ujl4d3hodCt6Q1d3aEJIQTJlV2drUVdLQ0xxV2FhNHFKYWVZbnQ5?=
 =?utf-8?B?SkV5WXYydGV5cWMwNDVEaTJZSjZJbXAxUW5nUmE1MzJRNmpya09SK3RvbjY3?=
 =?utf-8?B?NG1EaEJNQ0hxNnhjTm4rOUxMWWxLYUZtR0dpaXhoWlBEN21McVhjeWFvdTJr?=
 =?utf-8?B?SVFRV1VyK24yVFN2R1cvK25sbS9jdXBMR3k5bmxlNDhpcHU2eDcybkIrZDI2?=
 =?utf-8?B?dlROc2JCdVJESm5TVzFmeFBsY3RNaVhSbGNYd2VTTXBSOHVQQXZzZGlOWnVG?=
 =?utf-8?B?TTZRSllHeTlMcWJpbmdZREFkZnpLcVRLUzBxK0h3cEZEYncyMTdVRWttZ252?=
 =?utf-8?B?eitrZ1dKTjNTY251SDV5U1d6dmNuUDhiYTBQSk9OVGtzakZyVnRmZ3kyOTdC?=
 =?utf-8?B?OCtnU09XanUrRERMQmpXK3owVjhoWXFjMEJEaDhWUkFPaTY3ellYMmJNSDdE?=
 =?utf-8?B?QW1RWnBUNEp6dEZqY0hzQk1NcVJieG1KQlIrUS9KTVRYMVJMSG9KSHNvL3ps?=
 =?utf-8?B?b0lMcVFkKzZsYmg3bW9hamwrK0M5RDNsclFsdDBBUk1mTG9OQnR5S0dBL3B1?=
 =?utf-8?B?dzhnMERXV0V5eUlWVWFmeVlwSGk0ZVRWWlBRVE15T0s3R210SkxvMWs2bVUy?=
 =?utf-8?B?czFvVzBvTkZtMGxDTWVqMDhqcWZadWR6WkVWdnA1UTE4V0NpMHc4ZzNlNWpU?=
 =?utf-8?B?RndmbndGSXAvNkFBcld6czk5SG5RMElUTzlpbXpWaktYT0IvRmRQaXBVSHlB?=
 =?utf-8?B?N2FkWm5LVkhNT3NCeWFkdzdDSm4zbGxtYVFMT3lXNFZ4Y0YySmxLV3Rkc2xh?=
 =?utf-8?B?dnFUWFlwa0NFai83VTU2anMvZjZROW52akFQWWNhSEV1Z3B2eVJybjNXRGtL?=
 =?utf-8?B?eDlBV2pVRzViSEF4bUs0WXRvQW90VkE3WktoeHZmVGEwVll1R2xMUTlmZjJ3?=
 =?utf-8?B?bFg0U2QveHhVdFM3ZE9LS0doMVd3dEs1azRtS1dCNnRnR0ZzeWVlVUtjZTZD?=
 =?utf-8?B?T012UlRXWUNyYUxjdFBmdXY3ZnNjMXQwYVhjZ1lsTWF2aXZ0Y0EyT0dpeE5o?=
 =?utf-8?B?K081ais5VjBTTlp6QXJrK2VMdjNWMXFiVUUrQ29INzltajc3WXlvcXBRUlcx?=
 =?utf-8?B?SGlOTzVyaXNRRWI3aEZXMlZsSW9NQWFrQzViMnFMbVM1M25xM3VZTEZNdDVQ?=
 =?utf-8?B?MkxmQ2ZNSXR6ZTlZZDJuczcrRDBsaDgyYTMyeC9xTlNoa0hvZ3FWRTVQaGpi?=
 =?utf-8?B?Sk9nQkdNKzNxQXI1NUxBK0hmMzRMdExRdUZNRFFGbUhBSDVEWVA0Z2tzVkRu?=
 =?utf-8?B?ZWpUZmoyMVhSbFc4cENIcko4TDZsUEloQ2hRTyt3Zjc4em9FV1p6dFF4QzVi?=
 =?utf-8?B?RzhQOFFDRE9sRUNhN09xKzFLY2tScW50V3VLUHk2OWRmTXRXbXNiNUZPK0Zp?=
 =?utf-8?B?ZzZiRzhZMjFRUW1Pd1FuOWNlSzBpaDh6WDVBeEJUWE5jb0h3MEUwQTIrY3dK?=
 =?utf-8?B?WlgzYndnOFFUTVZpNU0rd0h0eFJGUGVqdTRqTkNIbWVCcXRwK1UzWkEraUwz?=
 =?utf-8?Q?w2KZ/Z2iXi0tvHXg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB5060.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96b337d3-4fbf-4d0d-955a-08da33283e1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 08:28:35.9737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BjDUIYdtCBtV3xMqJoXSn8BOZS88NEra/d+I4/h7q5CJjylQT5JScbGlK6b8GzrDfQdmXxnSCJ4HENUPjCSyuGQsolb2swy3pmER6ReRTik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2918
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

T24gMTEgTWF5IDIwMjIgMDk6MTAsIFByaW1veiBGaXNlciB3cm90ZToNCg0KPiA+PiBEb2N1bWVu
dCB0aGUgd2F0Y2hkb2cgZGlzYWJsZSBvcHRpb24gd2hpY2ggY2FuIGJlIHVzZWQgaWYgdGhlIGhh
cmR3YXJlDQo+ID4+IGF1dG9tYXRpYyBzdXNwZW5kIG9wdGlvbiBpcyBicm9rZW4uDQo+ID4+DQo+
ID4+IEJhc2VkIG9uIGNvbW1pdCBjNTE0NDMwYzUxZWU4ICgiZHQtYmluZGluZ3M6IHdhdGNoZG9n
OiBkYTkwNjI6IGFkZA0KPiA+PiBzdXNwZW5kIGRpc2FibGUgb3B0aW9uIikuDQo+ID4+DQo+ID4+
IFNpZ25lZC1vZmYtYnk6IFByaW1veiBGaXNlciA8cHJpbW96LmZpc2VyQG5vcmlrLmNvbT4NCj4g
Pj4gLS0tDQo+ID4+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9kYTkw
NjMudHh0IHwgOSArKysrKystLS0NCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9kYTkwNjMudHh0DQo+ID4+IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9kYTkwNjMudHh0DQo+ID4+IGluZGV4IDkxYjc5YTIx
ZDQwMy4uYWE4YjgwMGNjNGFkIDEwMDY0NA0KPiA+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWZkL2RhOTA2My50eHQNCj4gPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9kYTkwNjMudHh0DQo+ID4+IEBAIC02NCwxMCArNjQsMTMg
QEAgU3ViLW5vZGVzOg0KPiA+PiAgICAgICBhbmQgS0VZX1NMRUVQLg0KPiA+Pg0KPiA+PiAgIC0g
d2F0Y2hkb2cgOiBUaGlzIG5vZGUgZGVmaW5lcyBzZXR0aW5ncyBmb3IgdGhlIFdhdGNoZG9nIHRp
bWVyIGFzc29jaWF0ZWQNCj4gPg0KPiA+IEkgZG9uJ3Qga25vdyBpZiB0aGlzIGlzIGp1c3QgbWUs
IGJ1dCBpdCBsb29rcyBsaWtlIHlvdSdyZSBkZWxldGluZyB0aGlzIGxpbmUNCj4gPiBhYm92ZSwg
YnV0IG5vdCByZXBsYWNpbmcgaXQuLi4uLg0KPiANCj4gSSBhbSBub3QgZGVsZXRpbmcgdGhpcyBs
aW5lLCBwbGVhc2Ugbm90ZSB0aGUgbGVhZGluZyB3aGl0ZS1zcGFjZS4NCj4gDQo+IEJ1dCB5ZWFo
LCBpZiB5b3UgZG9uJ3QgcGF5IGNsb3NlIGF0dGVudGlvbiBpdCBsb29rcyBhIGJpdCBjb25mdXNp
bmcNCj4gaW5kZWVkIDopDQoNClRoZXJlIHlvdSBnby4gVGhvdWdodCBpdCB3b3VsZCBiZSBhIHN0
cmFuZ2UgZGVsZXRpb24uIElnbm9yZSBtZSA6KQ0KDQo+IA0KPiA+DQo+ID4+IC0gIHdpdGggdGhl
IERBOTA2MyBhbmQgREE5MDYzTC4gVGhlcmUgYXJlIGN1cnJlbnRseSBubyBlbnRyaWVzIGluIHRo
aXMNCj4gPj4gLSAgYmluZGluZywgaG93ZXZlciBjb21wYXRpYmxlID0gImRsZyxkYTkwNjMtd2F0
Y2hkb2ciIHNob3VsZCBiZSBhZGRlZA0KPiA+PiAtICBpZiBhIG5vZGUgaXMgY3JlYXRlZC4NCj4g
Pg0KPiA+IC4uLi5oZXJlLCBpZiBJJ20gcmVhZGluZyB0aGlzIHBhdGNoIGNvcnJlY3RseS4gVGhp
cyBtZWFucyB3ZSdyZSBsb3NpbmcgdGhhdA0KPiA+IHByb3BlcnR5IGRlc2NyaXB0aW9uLCBhbmQg
c3RhcnRpbmcgYSB0ZXh0IGJsb2NrIHdpdGggdGhlIGJlbG93IHRleHQuDQo+ID4NCj4gPj4gKyAg
d2l0aCB0aGUgREE5MDYzIGFuZCBEQTkwNjNMLiBUaGUgbm9kZSBzaG91bGQgY29udGFpbiB0aGUg
Y29tcGF0aWJsZQ0KPiA+PiBwcm9wZXJ0eQ0KPiA+PiArICB3aXRoIHRoZSB2YWx1ZSAiZGxnLGRh
OTA2My13YXRjaGRvZyIuDQo+ID4+DQo+ID4+ICsgIE9wdGlvbmFsIHdhdGNoZG9nIHByb3BlcnRp
ZXM6DQo+ID4+ICsgIC0gZGxnLHVzZS1zdy1wbTogQWRkIHRoaXMgcHJvcGVydHkgdG8gZGlzYWJs
ZSB0aGUgd2F0Y2hkb2cgZHVyaW5nIHN1c3BlbmQuDQo+ID4+ICsgIE9ubHkgdXNlIHRoaXMgb3B0
aW9uIGlmIHlvdSBjYW4ndCB1c2UgdGhlIHdhdGNoZG9nIGF1dG9tYXRpYyBzdXNwZW5kDQo+ID4+
ICsgIGZ1bmN0aW9uIGR1cmluZyBhIHN1c3BlbmQgKHNlZSByZWdpc3RlciBDT05UUk9MX0IpLg0K
PiA+Pg0KPiA+PiAgIEV4YW1wbGU6DQo+ID4+DQo+ID4+IC0tDQo+ID4+IDIuMjUuMQ0KPiA+DQo+
IA0KPiBXb3VsZCB5b3UgbGlrZToNCj4gDQo+IFRoZSBub2RlIHNob3VsZCBjb250YWluIHRoZSBj
b21wYXRpYmxlIHByb3BlcnR5IHdpdGggdGhlIHZhbHVlDQo+IGNvbXBhdGlibGUgPSAiZGxnLGRh
OTA2My13YXRjaGRvZyIuDQo+IA0KPiBpLmUuIGV4cGxpY2l0bHkgYWRkaW5nICJjb21wYXRpYmxl
ID0iIGluIGZyb250LCBmb3IgdjI/DQoNCk5vIGNoYW5nZSBuZWNlc3NhcnkuIEl0IGp1c3QgbG9v
a2VkIG9kZCB3aGVuIEkgdGhvdWdodCB0aGF0IGZpcnN0IGxpbmUgd2FzIGJlaW5nDQpkZWxldGVk
LiBHaXZlbiB0aGF0J3Mgbm90IHRoZSBjYXNlOg0KDQpSZXZpZXdlZC1ieTogQWRhbSBUaG9tc29u
IDxETEctQWRhbS5UaG9tc29uLk9wZW5zb3VyY2VAZG0ucmVuZXNhcy5jb20+DQo=

Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B499422D7D
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2019 09:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730503AbfETH7s (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 May 2019 03:59:48 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.131]:21666 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730502AbfETH7r (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 May 2019 03:59:47 -0400
Received: from [46.226.53.56] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-c.eu-west-1.aws.symcld.net id 4B/DD-32334-07E52EC5; Mon, 20 May 2019 07:59:44 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSbUhTURjHPbt312u5Ol4Nn0YGLaIy73KjaEl
  FfTGDoiChqJVd9eYm2xy7s62oMKEspcgkw0VTa9mbZNmrVM7MXqmsWVn6obSRvdKbFIFY9+7Y
  27ff8/z/5zz/c3hYirvCaFnR6xZdDsGmY4bRlqn0TN65utec+thuenqyOdoUrr2rMr18M0iZd
  t2fP5fOOFZfr85o+l4UnfGqtoHO+No4dgm9Qm11ZBd416gtTV/ORzubVd7whV5VESpXlaJhLI
  1vURDyVctFDMvhchU0V2UpAoefIygJViJFYLAB/O8/RjgBe2D7wAm1whQuQXDDv1jheLwMAie
  /DXmWw+urtxjCRthRvCfCNJ4AJc0dEdbgVdBV+YIiw4oQlId8kRQxOB2CB/sphRFOgv4tJygy
  LBG6wiQpYAyBy+0U4VHw5uWgmviz5NAfokk/Be51hhFhHdQ99akJJ0Goumyovwi2fe5llBCAH
  yLo/3ZNFli5SIamyonEY4OO9haG8AQIdTYM3T8Gao+2UeTsLga6n3cz5Btz4NOBe0OmsXB8Zw
  9NTA8oCAdP0+Q1KVBz6QuzG032/fM43z8S4SlQV/uO8kV+LA5uV4XpGkQfR6ZslzXP4rYLVht
  vSE3lDQYjb0w18gbjNL2wgc/Ri4W8R5TcvEEveCS9tN6eY8vVO0R3I5JXKdd5Z+NFtK8srxWN
  ZlW6UZrvFT1mbkR2Qe56iyBZslyFNlFqRWNYVgeaUnOvmYtziXmid63VJu/jbxnYWF2CJrBKl
  jWSU7BL1jwi3UE823Kw5wDF0Y4Ch6hN1AQVE1ZMlkLHnyt+b3UIJWnjNSgqKoqLdYouu9X9v/
  4WJbJIF68JKklirQ73n0lv5RAqOcSczEgIt/BX0hahhcOPDT6Ds1mTatIH2DPt772L8HR+3fX
  JNz194w9vPVQds9JDN6antbmS89MaqhaM3JvJxK2csT1Qt3m/e/aM6S0DFZsyOztmLTtS6l13
  wb87sL/Lz1Xs7V7RZWjAPw4Xz0sr9v907Ok7J6kf+eqbbtzMf3doXH6CRcs9WWo+1VL2WEdLF
  sGQTLkk4RcfGWsm0AMAAA==
X-Env-Sender: stwiss.opensource@diasemi.com
X-Msg-Ref: server-16.tower-308.messagelabs.com!1558339183!8544566!1
X-Originating-IP: [104.47.4.57]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6698 invoked from network); 20 May 2019 07:59:43 -0000
Received: from mail-am5eur02lp2057.outbound.protection.outlook.com (HELO EUR02-AM5-obe.outbound.protection.outlook.com) (104.47.4.57)
  by server-16.tower-308.messagelabs.com with AES256-SHA256 encrypted SMTP; 20 May 2019 07:59:43 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector2-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ihEV6KVO7NPLPpQdp3XrxgnJTRYErGU04aFUPxuwScY=;
 b=eiX5D6l/ZtlGwsy55JU9/truxFY1mZmBaJ9y1utWBrtME+39TAimfwxOYrtP5cBAWYv57MxnqHPubjZl2z43r80Sq48fTId+KHhGDtZelq+5+GFS8XgKmZM9B7UueNDLEl5W/+IcCKlAU/kQENUgA8b9wgRDKYG7K/l75YjgSc8=
Received: from AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM (20.177.113.222) by
 AM6PR10MB2470.EURPRD10.PROD.OUTLOOK.COM (20.177.116.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Mon, 20 May 2019 07:59:42 +0000
Received: from AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3493:d2c8:895a:f124]) by AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3493:d2c8:895a:f124%6]) with mapi id 15.20.1900.010; Mon, 20 May 2019
 07:59:42 +0000
From:   Steve Twiss <stwiss.opensource@diasemi.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
CC:     Support Opensource <Support.Opensource@diasemi.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: RE: [PATCH 08/46] watchdog: da9052_wdt: drop warning after
 registering device
Thread-Topic: [PATCH 08/46] watchdog: da9052_wdt: drop warning after
 registering device
Thread-Index: AQHVDcCca2OiVdBKu0WHGFpAEIQXSqZzqB7A
Date:   Mon, 20 May 2019 07:59:42 +0000
Message-ID: <AM6PR10MB21815DA0AE62D3A339464CECFE060@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
References: <20190518212801.31010-1-wsa+renesas@sang-engineering.com>
 <20190518212801.31010-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190518212801.31010-9-wsa+renesas@sang-engineering.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.240.73.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 777c720e-3917-49cd-f3d2-08d6dcf91e03
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:AM6PR10MB2470;
x-ms-traffictypediagnostic: AM6PR10MB2470:
x-microsoft-antispam-prvs: <AM6PR10MB24703EC87BA8033D883577E5F5060@AM6PR10MB2470.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(136003)(366004)(396003)(346002)(39850400004)(199004)(189003)(66446008)(52536014)(8676002)(446003)(8936002)(316002)(55016002)(66476007)(6246003)(11346002)(66946007)(76116006)(81166006)(81156014)(66556008)(86362001)(64756008)(73956011)(5660300002)(26005)(478600001)(186003)(2906002)(6436002)(2501003)(305945005)(7736002)(486006)(229853002)(53546011)(74316002)(33656002)(6506007)(102836004)(71190400001)(71200400001)(256004)(9686003)(110136005)(476003)(14454004)(99286004)(558084003)(4326008)(7696005)(76176011)(25786009)(66066001)(53936002)(54906003)(14444005)(68736007)(3846002)(6116002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR10MB2470;H:AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lJCZQ6hHQVzm0zQ2lljn/NP2kKu2+eS7/8MUqbt9DURAoI1zLOd8wTRICRZi7B5ygPKWLDtRJKY9PRF61yW4QLFcfpo8rSBhXojSjAXA2MyzanRZbwZRL2yovYEiTA4FX7k75P/otxBv6BJStF2pU0KnMQz6QK5Z1UGtwRvRJrra9mExYmM2Nj03VIpgPSVpJO0lfu3D75f7Z7V39e2jUcySpduflZdZgTHGLN2NMo3WHoY1CT/zDlytENuCzx35akYx88/GGplXcJMSVuYEq3kABzQPohnaYguuBJArLMjFO8NmAoD/b6NniVvglA3ND8rE0TniH/D6v65dLJlV6ZELMi3ka0eszKTLfxOxHKBJEtdhyt9EZ+x/ekU+QXUiAK7iMch643gjRR00FkxAflSBxAgUUSS7Q3+I1+b1tc8=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 777c720e-3917-49cd-f3d2-08d6dcf91e03
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 07:59:42.7137
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2470
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Wolfram,

On 18 May 2019 22:27, Wolfram Sang wrote:

> Subject: [PATCH 08/46] watchdog: da9052_wdt: drop warning after registeri=
ng device
> The core will print out details now.
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>

Regards,
Steve

Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFC6922D79
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 May 2019 09:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730500AbfETH6T (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 May 2019 03:58:19 -0400
Received: from mail1.bemta25.messagelabs.com ([195.245.230.131]:2375 "EHLO
        mail1.bemta25.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730454AbfETH6T (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 May 2019 03:58:19 -0400
Received: from [46.226.53.50] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-c.eu-west-1.aws.symcld.net id E9/58-32334-61E52EC5; Mon, 20 May 2019 07:58:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1WSfUgTcRjH/e1u22VenFPzcal/TCJSb7oVKhY
  VFOgfSQVBVpaeem4X25TdZLM/SiuwLC1LCC2Xi1ovSpJJaNorYTm1ckSWiaWuFzUpeqGosO68
  2ct/n+f3/d7zfJ/jITBVh0JNsA4ba7UwJo0iEDcmkKn0/O2jWYnNbYtSnl66oUzxuXplKWPj0
  1hK1YO0VXj6haYmeXr711Jl+mtXM57+qSV6Pb5FzllyCx05cuMrn73II3O0HWrBS1GtrAIFEj
  h1H4ODw4NysVBRR2RQXfVIJhUvELhP/hSKOYSC0oHz3Xskcihlh/0/G+UiY1Q5gi7nOpFDqE1
  w/JdXKXkyobf0i/AtIbAe9jpzxWecWghXBn/MWEhqGzR192DSrDIEA/f24KIwh0qDqZdDmMiI
  ioLPZY2YNCscBn2nZvIARcGZzoeYxGEwPjYtl/zZUH5zSim9x0PfgA9JrAH30zq5xFHgPXXQ/
  54B7uoehRgCqH4E5T1DfiEWnk++9A8zQWdjl1JcBoQNbh/w948E1/m7/gz7FNB5mRJZReXBh/
  o+vycaLlaO4FL/RxiMnijzLxMPDR0fFUfQ4rp/dqv7R5I4DtyuSaxu5ocFQ3etD29A+EWUnGv
  lDEabmeFMtC4xkdbp9LQ+UU8nJ2mZnXSeli2m7Sxvo3Vaxs5r+RJznilfa2FtLUg4pPwiz9o2
  1HDecAdFEDJNGPn12EiWal5uYX6JkeGN2dZiE8vfQZEEoQGyIms0SxVsZQ2so4AzCdc4KwMRp
  AklN4gyyRcxZp4zSJIH0cSt0yP1mAq3FFpYdTjpEE2UaDIWW/60mL1pL4pSh5AoICBAFVTEWs
  2c7X99AoUTSBNCGrYKXYI4i+3PpAkhhEwIsWLjTAgb81dSl6KYJzvOct+eVQa1DudsOHR49W5
  He2bC0QUra7HM/jTvN3558j5zqm/5Zltywd14PiMz+tyam5Fohb6i67v2TX7MkrcxS6871Z6S
  iN6GssehL0i6bwe99cd0VRLi+vqrC0DXWVPprJl7LS7JF9m6a2KZt10Vsd9T8Ou63d3bxlx1a
  XDeyOhiMSvP/AYFFbwbzgMAAA==
X-Env-Sender: stwiss.opensource@diasemi.com
X-Msg-Ref: server-5.tower-302.messagelabs.com!1558339093!8305091!1
X-Originating-IP: [104.47.13.58]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.31.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27104 invoked from network); 20 May 2019 07:58:14 -0000
Received: from mail-he1eur04lp2058.outbound.protection.outlook.com (HELO EUR04-HE1-obe.outbound.protection.outlook.com) (104.47.13.58)
  by server-5.tower-302.messagelabs.com with AES256-SHA256 encrypted SMTP; 20 May 2019 07:58:14 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector2-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bW63qJkMPCKfRjkV0pBUVosh1aEsSu6VVX21I847fbQ=;
 b=Cc5Ei5m3Vl7/Gzt5XR2/1w2Wko88pxpwQ8CghrapjyLsTaQABAPWriOiWL5DUJIk2f2acCyZaLMMUqVmN3PgopKBJ8+aN+fAzfB3EaidykvWxkQLPqdG2F/9bJr8g3IiOVSokbzCBLosBbZEy+tuHsuMYEumwTckLlqY+7eVx7o=
Received: from AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM (20.177.113.222) by
 AM6PR10MB2710.EURPRD10.PROD.OUTLOOK.COM (20.179.1.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.18; Mon, 20 May 2019 07:58:03 +0000
Received: from AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3493:d2c8:895a:f124]) by AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::3493:d2c8:895a:f124%6]) with mapi id 15.20.1900.010; Mon, 20 May 2019
 07:58:03 +0000
From:   Steve Twiss <stwiss.opensource@diasemi.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
CC:     Support Opensource <Support.Opensource@diasemi.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: RE: [PATCH 09/46] watchdog: da9062_wdt: drop warning after
 registering device
Thread-Topic: [PATCH 09/46] watchdog: da9062_wdt: drop warning after
 registering device
Thread-Index: AQHVDcCc27eK/+GlbE+D6ExJX7SYdKZzp1mg
Date:   Mon, 20 May 2019 07:58:03 +0000
Message-ID: <AM6PR10MB2181D0DCBFFBB3A5AE4CB151FE060@AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM>
References: <20190518212801.31010-1-wsa+renesas@sang-engineering.com>
 <20190518212801.31010-10-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190518212801.31010-10-wsa+renesas@sang-engineering.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [193.240.73.196]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d4be30c6-0371-4ef5-433b-08d6dcf8e2ee
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:AM6PR10MB2710;
x-ms-traffictypediagnostic: AM6PR10MB2710:
x-microsoft-antispam-prvs: <AM6PR10MB27109E974B1FCDB4AA5627ABF5060@AM6PR10MB2710.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:873;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(396003)(39850400004)(346002)(136003)(366004)(189003)(199004)(2906002)(9686003)(305945005)(99286004)(102836004)(7736002)(486006)(33656002)(55016002)(478600001)(52536014)(71190400001)(476003)(81156014)(81166006)(8936002)(8676002)(71200400001)(2501003)(6506007)(53936002)(14454004)(7696005)(54906003)(14444005)(256004)(76176011)(86362001)(73956011)(76116006)(66946007)(66476007)(4326008)(66066001)(558084003)(25786009)(110136005)(6246003)(74316002)(68736007)(186003)(66446008)(11346002)(229853002)(6436002)(6116002)(3846002)(66556008)(316002)(446003)(64756008)(5660300002)(26005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR10MB2710;H:AM6PR10MB2181.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GkS80liFjhoZeQ+dQn+gqnA8uqJV1gFv8vmShSA9eD1ssM6hZamh/S23j7G4aYRqhdAXlcYcvXR5p/s0EL6uR79q6CVEwsBZIbiyUgfftErPIVqhI+rTRKrcIFN3qZhCVAA/+Eky6MwjfcorezR887UWujqpofIXBbwDsbL7mbyFWBNI3cSZArom5KQa2HqvPniCkT1FJT5Jaj0A0JuW6k77qGAE9M6P+/cbqe3pRgZ+0uPTI9XjPD7/FfSzov6WEzRKeuT7cVo1q3/GuL7HXLdDjUEW72j/JuYO0G4EcO8xkCI2ggOLbeRyRhiHuGZ1Gtc2pO7nVmWuzExkxsqwfLg+wC1sKod4uf0fmlPvFJfCcyoYmWYI2D62p0czdilbxm9+KAFj1DytzhnfOpXY6tI8qYLBkLAt37tk4FRk35U=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4be30c6-0371-4ef5-433b-08d6dcf8e2ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 07:58:03.5700
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2710
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Wolfram,

On 18 May 2019, Wolfram Sang wrote:

> Subject: [PATCH 09/46] watchdog: da9062_wdt: drop warning after registeri=
ng device
>=20
> The core will print out details now.
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thank you.
Regards,
Steve

Acked-by: Steve Twiss <stwiss.opensource@diasemi.com>



Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDD110EACD
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Dec 2019 14:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfLBN1p (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 2 Dec 2019 08:27:45 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.115]:37437 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727362AbfLBN1p (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 2 Dec 2019 08:27:45 -0500
Received: from [85.158.142.204] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-b.eu-central-1.aws.symcld.net id AA/56-19905-D4115ED5; Mon, 02 Dec 2019 13:27:41 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA1VSf1CTZRzneX9sLxyb7zaMR3R1NzjPio0tZs6
  6DpOuw06x8o+KWvqOvbLV2NY2rsHJHZJcBQxBohiCQsc4wIUHXdbU4/ghbuig5CLGzlPKSQfJ
  ZWwnGjdsL++0+u/z6/k+n+e5L4EKxzhpBG230RYjZZBwkjBdVuIL0n2C22p5fR+i6m3yYKpA3
  yBXFerwI6q756dR1a2FNXQXntfjduN5x6PyPM9KBTcvPPDk61gBrjdqTPZDuC7irUXNrTz7xO
  ftoAKMJVWDJAKQLhROzrkASy5jsPahg8OSbwFcdTxYJxjpQ+Gp/mGMIUKyCYFDg7U4S+YAvO6
  fRqpBIsEhVbDRN8dhcAp5EHrbJlAmhJIOBK4El3HGEJE58LtoZzy0C3bNhbnVgIjhfLi49A4j
  Y2QGPBntWp/JIynYOBzhspf5Edgx5QWMkUi+BAd657kMBqQYRo6eQRmMkqkwGDq9fhiSJOy8+
  CPK4o1w4dYazuZpOF4ZAKyeCSdmQnEsgafaLsWxGE6dronjfXDoRB3O9GTyzr+FrKyCnTVVGC
  tnwLWRUlY2w56FcPzkVhi48xnKRrZAz4Ns5iWQ/AmHN8+F0XqQ1fKf0izOhO0XljksfhZ2dfy
  Btqz/hACOO0NYO8B6wU6NRV+ksxVTeoNUIZdLFYpsqVL6nFIpo8qkGhldIi2kjTYLFXNl1MdW
  mbW0uNCglRlp2wCIbZT2IyzyA6i8tyQbAZsIRLKRFw2H1EK+xqQt1VFW3UFLiYG2joAtBCGBP
  CX/tloosNBFtP2w3hDby0c2JJIlKbzyDTGbZzVTxVZ9EWtdAVKifqHta1SIGU1GOi2Vl8yESC
  akKzE+HvFou6eAOE3EAwkJCcJkM20p1tv+7y+CVAJIRDwvMyVZb7Q9vmkxVgKJldhx7DemhI3
  610qrQBrE0m3Xfh090tDastVkbSfOPJy0bCsLdK9duL99KP3a/BHhp5mX357F84fvqD75At3v
  Krw+87M4KBjyPd2taWqunw52vr9XNOPS3jxgfH5Eff8v8G5qliBn9zfpS/6Iexa7UdTSk0A3v
  LXo/j3/De6q5+jZnfPO5mVXq9bGKfCZyxV/BkT8N/sPfHBFHS2vkTvLu1/dfC575bX3Dt3LnQ
  emVwwfzo6mXNRLjysHfWMZ43XOjLO76178/qkn6jw3Ciqu5pbluDftOMy/u925eU96/Z4vK+V
  VXV818hMrO6YvVZ2/6tmwuiop+GXU3+dF+MGJwb1VxyZfVhL9zaNyuyO31e6QYFYdpXgGtVip
  fwDU6w3uWAQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-10.tower-249.messagelabs.com!1575293260!396128!1
X-Originating-IP: [104.47.9.58]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.22; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12526 invoked from network); 2 Dec 2019 13:27:40 -0000
Received: from mail-ve1eur03lp2058.outbound.protection.outlook.com (HELO EUR03-VE1-obe.outbound.protection.outlook.com) (104.47.9.58)
  by server-10.tower-249.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Dec 2019 13:27:40 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J9zLZpmkRamVxzHAdHL4kx1FLQ7wQXIRtol1+1Ml8Lcvjo5Ribt3A7MDFUk7pCUj2wivAseNe2BvO9DqFa6tsRgSkUcRDq1aSUsAxxcqpzWVp1yYCchkfBcHbrExo3U3j7Wpbb+WhDwk9h1OzR3/4mlSzOwhwbufQbhx0R12e4g2dn9GhBsKMhzIZISgT8kOG2Obo+fzFVD36bn7RgUuEO08hN1UCU3Xj55oG/FdC/WXnHbvIn87ueUeok/MiZvEEtYt//PIw9De5BevujYQnQhKyT77BUzWNMUlx+kY90sS1J84rq3RjCyQfY+yBWGifUXwRfk2Wmyjs2hV3lHJcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DH7CMHeszaxARzWi1HoITDH3ZWvONYzuVJAUKLODwQs=;
 b=Xu5Ll4fMFHGM6OQa2Rc4bFsluCqyZIpYYICwDuIP64RFiAuJoZfTslYYU2xzrlis+E2RtuPPImSSjTaPgoLNwRTw1fvG74NHPeFV+PokB4OqhKDX9JmiBzDjU/apo3DPzKV5ZJSG4gPXzAPO9Mu9UqYUdiWrF/KKXT+s4fYU8OMGrYbOKY9wuscjdxDfKYZDKGXTrdT8vnU05TZC3mLybeZ75K+czWpYc3UFamht3WhdRvQCuCO+bo6QzLbfy56bQpa+iI2oFjC60IfBUsN+r7AZkbAowLg58wcQWNqeCpE9NECqn35MrTwekP/uviqGUHz9gv8QFxXKbD++kzJbXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DH7CMHeszaxARzWi1HoITDH3ZWvONYzuVJAUKLODwQs=;
 b=w1f1X7DWdobBBjrSnypVUZQ7RMjajwgzYplB+p5kSSyfbOfVCvRDnbWZcA3vFEVcvTr9PhYKltdZvcAqXhScStccb5BqAhx68yKPSbz05WB7arQIIaAyuvA5X4+3fqiHYBFvwG58CNE+ycsottUJ+V7h3H1+TO6rUbcf6mgmMfk=
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM (10.169.154.136) by
 AM5PR1001MB1042.EURPRD10.PROD.OUTLOOK.COM (10.169.154.141) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.21; Mon, 2 Dec 2019 13:27:39 +0000
Received: from AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df]) by AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5525:87da:ca4:e8df%7]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 13:27:39 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
CC:     Support Opensource <Support.Opensource@diasemi.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH] watchdog: da9062: add power management ops
Thread-Topic: [PATCH] watchdog: da9062: add power management ops
Thread-Index: AQHVphAFwdyccq+61U6+GK1Hr/H0vaemod1wgAAQYwCAAAQN0IAAH0kAgAADedA=
Date:   Mon, 2 Dec 2019 13:27:39 +0000
Message-ID: <AM5PR1001MB099461A4E8253F74FC11D6E480430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
References: <20191128171931.22563-1-m.felsch@pengutronix.de>
 <AM5PR1001MB09946EB98C8119345472BDB380430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191202105646.xzqzlu2jnel4qbuv@pengutronix.de>
 <AM5PR1001MB0994B329C5D4B8846FC7A71880430@AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM>
 <20191202130314.dzne7eh2b5sb46c2@pengutronix.de>
In-Reply-To: <20191202130314.dzne7eh2b5sb46c2@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2bccb099-c179-41b1-450b-08d7772b6766
x-ms-traffictypediagnostic: AM5PR1001MB1042:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR1001MB1042F80489E2B9632213218EA7430@AM5PR1001MB1042.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(376002)(396003)(346002)(39850400004)(136003)(199004)(189003)(8936002)(11346002)(66066001)(76176011)(7736002)(33656002)(54906003)(110136005)(74316002)(55016002)(229853002)(6436002)(99286004)(4326008)(6246003)(2906002)(66476007)(76116006)(66556008)(25786009)(66446008)(14454004)(55236004)(6116002)(3846002)(64756008)(9686003)(305945005)(316002)(5660300002)(7696005)(446003)(8676002)(186003)(478600001)(66946007)(14444005)(26005)(256004)(52536014)(71190400001)(71200400001)(86362001)(102836004)(81156014)(81166006)(6506007);DIR:OUT;SFP:1101;SCL:1;SRVR:AM5PR1001MB1042;H:AM5PR1001MB0994.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3uQ23JFGjbr0oh1muLjpUYMSCB3wng8t4KoXgIQokXe2HTj3HkSfD9YRBDXXLjOxFE51nEPXLbLFc1pcrPt9oXvKoWp3+3nQL4PK4xNkQ/LwJu4okTWCd1pjLHCmQfxILOJe/A5yNfHnvnBsEqW+h3BY+aXsgAHyDA2h6XyXugWA+A4qdfN9emR5Ti/J+K4klqhQP2cpoyT6b0zhH2t8SN49Rn+2DdJt/unQg5axUkn9KSOMZLU2AGA5+ri1DCd6NxmvEgd1zYz4cn99iZLINmrUl/EefEMt8rzwm/81Nz/0RQ134dKRE4L7zZ6TAlU9EcyCdHLwkY+Itfatipjc6mwZ7AXqpjCeDMHvZEdHRl4h73+LkMdSNIYufyZyeoYYOgLh0Ls+kcMk6jzwlFY5imvm5NMpXTS+yDSVWXzwRpdatqAdmwbBBEZsJgicTMOd
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bccb099-c179-41b1-450b-08d7772b6766
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 13:27:39.7069
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PVkR/TlVkUnegdg08OzxbGY+1+wTN9b96PTes51C9PEA8SP+8Hf56GoZbkJJWqTpDgome/2FHPeipL5XNclNmkkcmruYzgwAd2jV4OUw5LA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR1001MB1042
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Marco,

> > Hmmm. Wouldn't that then be a board specific fix rather than this chang=
e?
> > Am concerned relying on software to reenable the watchdog on resume cou=
ld
> allow
> > for a hang scenario potentially if that code never gets to execute. Oth=
er
> > systems shouldn't need this fix, assuming they don't have issues at the=
 HW
> > level, so this this seems like it could be making those systems less ro=
bust. If
> > we are to do this at the driver level, maybe this should be an option t=
hrough DT
> > to help faulty systems, but I'm thinking this shouldn't be default beha=
viour.
>=20
> I don't think that we should rely on the OTP values. Those values are
> set by Dialog, the SoM manufacturers or by the customer itself and the
> time shows that this is error prone too. At least if the customer or the
> SoM manufacturer don't ask the Dialog Support..
>=20
> You're right with the (re-)enabling but there are other drivers using
> such an approach.. IMHO it is safer to go this way rather than trust
> the OTP and the PCB layout. I would rather add a dt-compatible to tell
> the driver to do nothing during suspend/resume e.g.:
>=20
>     - dlg,use-hw-pm
>=20
> or something. Because the user needs to validate the PCB and the OTP
> values.

The thing is the DT FW is supposed to be fairly static so I would rather no=
t
enforce this change on users if they adopt a kernel version with this updat=
e in.
I also still think it's safer if the HW does this for us. I would have hope=
d for
most designs this would be caught in early bring up where it can be rectifi=
ed
with minimal impact, although I'm guessing that's not the case in your scen=
ario.

> Regards,
>   Marco

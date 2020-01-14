Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85E9D13AF27
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Jan 2020 17:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgANQUu (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Jan 2020 11:20:50 -0500
Received: from mail1.bemta26.messagelabs.com ([85.158.142.1]:57178 "EHLO
        mail1.bemta26.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726053AbgANQUu (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Jan 2020 11:20:50 -0500
Received: from [85.158.142.108] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 1B/08-21277-F5AED1E5; Tue, 14 Jan 2020 16:20:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBJsWRWlGSWpSXmKPExsWSoS+YoRv/Sjb
  OYOcDCYv5R86xWqyaupPF4v7Xo4wWl3fNYbO4sW4fu8WThWeYLD7susps0br3CLsDh8emVZ1s
  Hneu7WHz6P9r4LHzewO7x+dNcgGsUayZeUn5FQmsGaunf2cseMVR8ePPR5YGxhvsXYycHIwCS
  5kl1k+37mLkArKPsUhs3v6cHcLZzCjxu/cnG4jDInCCWWLN7V9gGSGBiUwSv5Y+Y4Vw7jJKzO
  1fDDaMTcBCYvKJB2AtIgInmST6z71kAnGYBT4zSrzs28sCUiUsECzx6OtpsA4RgRCJqbN6mCF
  sI4nrM5eCxVkEVCUW3TvFCmLzCsRKfHz+AaxGSCBPYsPOh2wgNqeArcSHtzeZIN6QlfjSuBqs
  hllAXOLWk/lgcQkBAYkle84zQ9iiEi8f/2OFqE+VONl0gxEiriNx9voTKFtJYt7cI1C2rMSl+
  d1Qtq/Eo43vgGwOIFtL4vZ2bYiwhcSS7lYWiLCKxL9DlRDhHIlFHW/YIWw1ibOnZkFNkZHoPz
  sDHHASAhtZJN7N/cU6gVF/FpKrIWwdiQW7P7FB2NoSyxa+Zp4FDglBiZMzn7AsYGRZxWieVJS
  ZnlGSm5iZo2toYKBraGisa6RropdYpZuol1qqm5yaV1KUCJTTSywv1iuuzE3OSdHLSy3ZxAhM
  ZCmFTCw7GE9/fat3iFGSg0lJlFdkj2ycEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQnebS+BcoJFq
  empFWmZOcCkCpOW4OBREoFI8xYXJOYWZ6ZDpE4x6nJMeDl3EbMQS15+XqqUOK8ASJEASFFGaR
  7cCFiCv8QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmNcaZApPZl4J3KZXQEcwAR0x/xTYESW
  JCCmpBqb1h2PatzBbO6xb2THrI4P1rT2c6ZMLzgqGZH/j3NFSurnlpC7Ldr9pp4vjO69vPbqG
  v1tf0yPZuTLd8rR8Aa+UVIO7TsSmd306lozxcRkHDJ5eY4rQCbyxNpA314En6XTGNP6+z/bv+
  sUuLZra5eVe9tv7/Zsn73eVvX9+ZMulw7GirFY555XsBcwXlDMsNl7w3cWBZWXeL9UVrgLrTk
  wvOfzy3ten+3K7fvXpqevoffp4crHXhe1+Av2hercFPs78yHn1yDeFY9+enX+rPederbSNgvT
  WLQ7W4YFvuiI2sD1Jzr1w9WzBbJHuRxcvJFnzv3D5MNmu8M3S5O4lr1Y4na2o+vtSKrfhj4pY
  zT0lluKMREMt5qLiRAAT7n9kawQAAA==
X-Env-Sender: Adam.Thomson.Opensource@diasemi.com
X-Msg-Ref: server-14.tower-233.messagelabs.com!1579018846!344594!1
X-Originating-IP: [104.47.17.104]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.44.25; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 4534 invoked from network); 14 Jan 2020 16:20:47 -0000
Received: from mail-db8eur05lp2104.outbound.protection.outlook.com (HELO EUR05-DB8-obe.outbound.protection.outlook.com) (104.47.17.104)
  by server-14.tower-233.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 14 Jan 2020 16:20:47 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhnxEYBAkP4urFYrbu7qySs7xcJ+fwpofpb7vytTHzyVJl2/lOfyB5Y9HuQqFlrdQTXlzf8sy9tuOFvI8t4mKMRUsmXJSFXttzblwM6jMnBrRqNlB2xY4PbE/Beyn1T+x+18HFgyda2fVcWivcxL6eE0xFNZ4twVRAHs7mnoiIh/ilVw+FNmpCJziIPkLu4IEoHJjGC1rkqReaxkLiPs1fMBff8wUIih5YyzD9UJkxd3/EddM1bq4kDfVkzwQ5yrpmWKqcNan/Uq0hLfWUnGT1agTDdcQHTDpSBC4ftpGT2AFIc6r+xEzixUA+DLSoIH82nriFztCT+97kt1LCDSmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sljo3kSWySw59svqQri+LL864sW6vAcwmvJiP1Ct9E=;
 b=WKatsahRJkEetG/sjWLGKzcPf7O5pbMFJldM6b21Jwd/l6IVkrwfUZfReERmM56/KbaWY7d4yXBEbNMtYHo7z7bmnAuoHZiNJjE/I7SvzXqDD8I0x69Ksuy7qV05p5yDPOYrX4uJbfsYO8k+vGEd8cTNyEsQvMmPvPlL05TiJKTyTY92uZ0ZNIa2scnIqVNeoMrU6pkrGxZIlIao8ktlOD/s2Pex9V39ccfnG2M3zAUX3GrqDZtHg5y3o9ilVH12jg/ytK05qG010UX/Ll1bLHNbvIPQZ82sWzETeNcckMeYeoqcYItwN/ijNBV+Yjx05F3jnWszw4MIJjcYto4V4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sljo3kSWySw59svqQri+LL864sW6vAcwmvJiP1Ct9E=;
 b=OIxr9/oBFT2YByrAguTulaANfnZn56PGZcKEaoCWBfOCNBExZoey3dqaHYmzYv/2s1xLtvacvLUgLMBZ/sEbDbjDGWflFHvCPJjj1gehnE2Sdr4WIMmORTaxMHU+YpUSDPdNZqs3UD7b5GDienGShmPQZ//Tq2zzcVIpGpozYzk=
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM (20.177.116.141) by
 AM6PR10MB2518.EURPRD10.PROD.OUTLOOK.COM (20.177.115.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.14; Tue, 14 Jan 2020 16:20:45 +0000
Received: from AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9be:9fca:6def:97c3]) by AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9be:9fca:6def:97c3%5]) with mapi id 15.20.2623.017; Tue, 14 Jan 2020
 16:20:45 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Marco Felsch <m.felsch@pengutronix.de>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        Steve Twiss <stwiss.opensource@diasemi.com>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: [PATCH 2/3] dt-bindings: watchdog: da9062: add suspend disable
 option
Thread-Topic: [PATCH 2/3] dt-bindings: watchdog: da9062: add suspend disable
 option
Thread-Index: AQHVxgoHZ3qZJag3tUel845QdWMl36fqYLpA
Date:   Tue, 14 Jan 2020 16:20:45 +0000
Message-ID: <AM6PR10MB22637AEDB8E98F5B14CEC7E680340@AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM>
References: <20200108095704.23233-1-m.felsch@pengutronix.de>
 <20200108095704.23233-3-m.felsch@pengutronix.de>
In-Reply-To: <20200108095704.23233-3-m.felsch@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.225.80.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd9e040a-a3fa-4ed8-858d-08d7990db5bc
x-ms-traffictypediagnostic: AM6PR10MB2518:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR10MB2518B5FEC683671D682F2551A7340@AM6PR10MB2518.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:1332;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(189003)(199004)(26005)(55016002)(316002)(54906003)(71200400001)(8936002)(110136005)(8676002)(9686003)(81166006)(81156014)(55236004)(6506007)(53546011)(7696005)(478600001)(15650500001)(52536014)(86362001)(76116006)(66446008)(66476007)(66946007)(64756008)(33656002)(66556008)(186003)(2906002)(5660300002)(4326008);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR10MB2518;H:AM6PR10MB2263.EURPRD10.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: diasemi.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E/+iPG/Z55wd7r19KBefsqmSzW0n8UBidsipUezBZseCxHL1JmSKWLaZHN80UkxdJ3r7drayQzMRJ7NFDdgtYjkDQeW2yL4mu7DAi6z4c1NKmXaI6FBbf9Q2qqWpHw04aTLSymylpoUUQVV5aJxzHazCWcyPePLvlJEeMK0zXhnv6Mh9o0Ux6vNrCJmVLdAA7NxLYPqEy9ccKR87TM/L9g9A7lm0s7WMZzEJ/jNtAxhOE+K3Yg9EPo5prQ3cd3Z9WfodylVdwxzEymhGqbwSMm2fctA3n2P9SQ6J72ym8Kp7JATTTRPf9eR61JI51GB+CFgmeAztcb2oPO3qZQd4CvvGS6O4Uaw1ZeqOp4r3WX67LVjMKNGN4gW723/8zeo1I+tRT4kDahjNhQNaJcWpmlzlykukjSPPIvKa0Sp0BzXyEylJ2QtyOusTWIq2OmNJ
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd9e040a-a3fa-4ed8-858d-08d7990db5bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 16:20:45.7520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zckmihdpqr1E4lwi1QLbvf++QJkn76N4b6qrxhwzdcWaq2BZDhaSz5FxDAFx+tc2rkrO1rm9Yx03SeUnhT+oIVgymwpFvoPgRDmRtgQ5Rio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2518
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 08 January 2020 09:57, Marco Felsch wrote:

> Document the watchdog disable option which can be used if the hardware
> automatic suspend option is broken.
>=20
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

> ---
>  Documentation/devicetree/bindings/watchdog/da9062-wdt.txt | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/watchdog/da9062-wdt.txt
> b/Documentation/devicetree/bindings/watchdog/da9062-wdt.txt
> index b935b526d2f3..950e4fba8dbc 100644
> --- a/Documentation/devicetree/bindings/watchdog/da9062-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/da9062-wdt.txt
> @@ -6,6 +6,11 @@ Required properties:
>  	"dlg,da9061-watchdog", "dlg,da9062-watchdog"
>  	"dlg,da9062-watchdog"
>=20
> +Optional properties:
> +- dlg,use-sw-pm: Add this property to disable the watchdog during suspen=
d.
> +	Only use this option if you can't use the watchdog automatic suspend
> +	function during a suspend (see register CONTROL_B).
> +
>  Example: DA9062
>=20
>  	pmic0: da9062@58 {
> --
> 2.20.1


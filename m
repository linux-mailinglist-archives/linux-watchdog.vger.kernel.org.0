Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 351B94CF401
	for <lists+linux-watchdog@lfdr.de>; Mon,  7 Mar 2022 09:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231767AbiCGIx5 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 7 Mar 2022 03:53:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbiCGIx4 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 7 Mar 2022 03:53:56 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2121.outbound.protection.outlook.com [40.107.113.121])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9FD9CE8;
        Mon,  7 Mar 2022 00:53:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NGfznPCcDj8S4ZRmRM28Iiloi51SCw+NCx52AofyNgQlaOBCYvipRkOIr5m/KO7s/CbW6YLLGYs7566kHFtO9tslTVhus0xuLJbVnJBE13BlR7RrzCp426zf0KXilXKzf1MMqMVuPZopBMXMUUz/AVnvCaocuzLH5tClXzIVH8WcmxchabOCmh74QRlkZueDKC++zQnWrBcEEh2IecS9HBNUTDko6D5eJ/VCZTKjfeyCaKB0mxWMMAJaJxWOxE/7DhIR+xyco5kqzgnQKE2XbNP3E0FCpMRS7Xlq+4eKrGv8hhG7J0QgmpNxEaeyRvuRHw7LDR+LVujyk7bQSYbJ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkansIYwDCazl7juiDzgiXDLPVdckSopcm2mht/Psw8=;
 b=OPGe13qPpkf+xIfeDRDbQvKGNyX/FD3SbtDosQNB8MkpvwbFuox8r1w48ZP9/cQfNa6TIAuPOqqfmq6SPL2gR0DcXH2izIvkwmVi1whyq3EXf2ElX4KxxnN4HqtV2JAgTTbhMmbP5BC6J3Y0mkWAkD/xADd1eNQWIVMpQLtA3gO6avcFxxu8Hkfnuwfp0VjRNTYDXFHjEnsMEv4A+auYpGVuWnBkQOcqO11vO7GfvzCMnzIIMy6KjRBMfRr/i8V64YTokeJ0lFum6ZCxCobR6uClWnXlhEQc9aP7bXUS/61CdOEuC7aVbZfXIRj2ilUX/pGTv9Gy78qnvGP/TlAtWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkansIYwDCazl7juiDzgiXDLPVdckSopcm2mht/Psw8=;
 b=jqjLZgkDSyljoDvtRsmG46lyiwg9RzM2JiDxN6rQdul9ElSSoYl/7i+WhvoTY9OVtUiyvuMpOJ5Jnf53Cdg7JjFQqbrJ49cBVm7bgmC4bCEXRT5t6iwAbSwyfuQX6wxhd58E8Oa+70WukYmthq3SUMTb+NMJAc8/5JHeM0NrQoU=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYAPR01MB2128.jpnprd01.prod.outlook.com (2603:1096:404:2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Mon, 7 Mar
 2022 08:52:58 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.023; Mon, 7 Mar 2022
 08:52:58 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 0/7] RZG2L_WDT Fixes and Improvements
Thread-Topic: [PATCH v5 0/7] RZG2L_WDT Fixes and Improvements
Thread-Index: AQHYKnCZrKtJ0aTHxkCr0aawkDygoKyzrFnw
Date:   Mon, 7 Mar 2022 08:52:58 +0000
Message-ID: <OS0PR01MB5922BE07E79DB3CF32B8D95C86089@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220225175320.11041-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220225175320.11041-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfdb04a5-5d54-4415-d099-08da0017e0f2
x-ms-traffictypediagnostic: TYAPR01MB2128:EE_
x-microsoft-antispam-prvs: <TYAPR01MB2128A0B1F49D092A62BFDCA786089@TYAPR01MB2128.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ecjm4E8GK9wPYUt2Cy0YAU/ZBwrCGoIs4iyA+ZRaYyJQNVGIq/E98HspjIuBzZYq5mPHobFwugKTOQvmo5Xp8CQYV5TZgWJRQfpNThNgvBFyhpcARCnIpupyF7iWDiOACoU8xNZXZVuE7TY1veKSD47tdHLYbIlqv3V39tyuOky68WeRE1+YQ9sNUQYPVs1V3bp2XNLyUo40muEOove0rVb22je17IZEN5CisYpCt83H624eS0+6PkrqI6rmk8mkFdraHQl/8EPJQICw0Cye42SuFIXHXtzYJ6Pr63+Lk+LD4ZDgnI1/1+ZjUGFI2IEgJwWoyBxYtnDR0W0vHdyTpJvF/CkrrHdDjFaAZxZeYuLVcsKAnEHPaw4ToX7AGd6rr0joeYdMnDipO3dneF+X3VgMJj2Fkb2czEVLrY8PjUrWWiRl5ZPEecnmzjIUYR6LdYnYu/YXw+EOedHfNRMzpY8RNlexefzKyw75V+kbwJYURakPWvNaKTWhDYtTDneqc1j4SOxywa5WXrozcCWtOrz2cK7xefOkMBCe4dsa+xJpsYxI17wvsOZxbxm70Sr6wJ14edk1mMoYu2CXCJzwzoYe6AJY4LjX15NNfVLLpdqcb5IFWUH8xt+W5c3sftFsSNk+GdWd0SwyJE6Cvq02xaOFRq+Oo9t9CHZBDnaHrwSk54TvS9z3ICutUgo4FInYSy8dcQW5c4ny+p4Zws+CwQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(26005)(9686003)(6506007)(54906003)(71200400001)(5660300002)(38100700002)(33656002)(110136005)(76116006)(508600001)(186003)(38070700005)(316002)(122000001)(2906002)(55016003)(86362001)(64756008)(83380400001)(52536014)(8676002)(66556008)(66476007)(8936002)(66946007)(4326008)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3OHJTWXdK4q+LmO30qA3xvZcAOTabIPjDgapCKLXDqP6AE55mZjho/d1t4zJ?=
 =?us-ascii?Q?d+epnmWyVPjD9QyAzpX/+Rcn2yz6JJ2R19iR3XGBPGZYkdGMln/2LicjjV8v?=
 =?us-ascii?Q?FAhViNqV6lRTojRZQ6qCoLm/h+WoIGWYKcPEhTEcASd6rC1IhIgWEjU/JC1L?=
 =?us-ascii?Q?CEBaKnAKmDpuceXiRUdTjgDEY18qfQDz74wt7OkwTCel6vGzjLw78bxRv7mj?=
 =?us-ascii?Q?WkFKzM5ulz8Aj2Cxnp9r/YGVBSIuZGq6cDq+oaUq9OVqhU5KXU2BzU7usXRt?=
 =?us-ascii?Q?HYLaGf/X3kcmmM2rJnxXGzCpRhfRvag33ob08fr4KMmXkO029fvVTA/gKqVK?=
 =?us-ascii?Q?IZ7KjRo19H9IFVRR7qAlob15Yaibl0NszW82qdeAtR7zP5E9TSYOfBxs08WZ?=
 =?us-ascii?Q?EbOXKgc5S/2fvcxIXA3hODuhBSAkU4B4UiCloRkp/4UXy0F4joA/oEpBBAOv?=
 =?us-ascii?Q?k5+hUGWiCdnjentj2YA1v78LqQu0vAuVpJuMlxyN2jfTAA7CGxqwk60fKdLK?=
 =?us-ascii?Q?GmWW64lMVLfzq6fdBovxyTeUwEo83HZDXdWeN9g2/SpNBnJ7nfmGYB6PTyRD?=
 =?us-ascii?Q?An8oN8/WbYN5A6rPVHaEQ/dVCD6QD02NeEwJSGOzQ4ZVfaV3j+QuS6AuTPr/?=
 =?us-ascii?Q?sQKAKlIbDY3UIMIkXB5APAQSHx+TmBFH2666ec98unaqlT0DxGVBMf6527iG?=
 =?us-ascii?Q?WqDZxqeEwzsoaCb/sWv5y4xs+axaHSGmPZSXs1Z87zFMGtok/bNgOoXvLSj8?=
 =?us-ascii?Q?FblukESiI5ppKqC7V47n8W9cJuJwo+wd563ryoMcJRDJhPrbEN1tEMmSLnaS?=
 =?us-ascii?Q?IUkmdamIhVq00B72Jz38hH8cahvfRBrTAn8vSR6Q8n5+ngfSqKwinJmdjYkS?=
 =?us-ascii?Q?UPdZhZ0Gvd89wv3CmbR8U7iUunKm6EMRdcBpyJkTZy+JwYwFbQlN8ag2yVRc?=
 =?us-ascii?Q?PK/OUkKWiDtMu5AwRpUs6UNtb7lAlE1xmmJZ2Ov1/pH+e+/GLl4mipdbGfbp?=
 =?us-ascii?Q?YT5qoJV/R8UoB/IU4LV1dWcLgGDsWa6ueyuHMjZXgcpjKxKdiiGpwD3haiOK?=
 =?us-ascii?Q?zO8s0/2KkPQDz6/vk7CwOhs3nGzG0C3cxGKYNjhmxEFHIyNwtplMf70pOvWG?=
 =?us-ascii?Q?EP0HF/x0X0I6fRz3mMr55kujMDc7WPKhaQp9leVLRlFDgXdrFeRvS/rbDlDz?=
 =?us-ascii?Q?kD0HzvRzfP2UIy8zcnJQQzdR+m9XJAXzHaELgn6YmB5iWlEp/C8VC53GIw/i?=
 =?us-ascii?Q?AmI0Vn24c8Xwyx3VtHgfAbXBiT3PPdi0nalwQBQEt3W0PUHQeVg1tEAEtY+8?=
 =?us-ascii?Q?2gk/kKBJLvGvW0AdWrRkQlVMWbdUBp8zq/7XjmWUobS56IIp3A7XFDHNbKtS?=
 =?us-ascii?Q?IMWAxhtKPTYK6tFm3ImK3wDJkXppefKRqj3U3vDf6K/8NwvNaeK5YwJ+wytK?=
 =?us-ascii?Q?3pR0vWLeip1i7GFtBha7liw+0G9lL9OIpYL6ITg80sudDKtgxlrw1aKvYnE9?=
 =?us-ascii?Q?Tx1zeNhZPknM8UDx2WGsDMXDz1w9ASeHenoUfJ+gfsZlYGQAv30dJSi7nooX?=
 =?us-ascii?Q?0Y3uUQ/Z9JIFGg1UnAlj3buCxKiwXZ11Jp00cXdexdnoX0vB/hSVJVEBUr7W?=
 =?us-ascii?Q?iuIEQxml9nPGTs8RLDro9qv5oNFO9N8Gxw2KWVzdwb3wnVuf073eXyXEKH4m?=
 =?us-ascii?Q?Xv9V4Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfdb04a5-5d54-4415-d099-08da0017e0f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2022 08:52:58.3822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nMtpP8ClQj++7DOfKqCHSbM+I8jZNYQtMsnv5A9CLeuBwnSV3jo4UYrIsfbP2stkh1butSyNpggB2PGCaNi1N2BYirXV294VyvQUtNlEa+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB2128
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi All,

Gentle ping. Are we happy with this patch series?

Please let me know.

Cheers,
Biju

> Subject: [PATCH v5 0/7] RZG2L_WDT Fixes and Improvements
>=20
> The first 4 patch in this series fixes the below issues
> 1) 32 bit overflow issue
> 2) Runtime PM usage count issue
> 3) BUG: Invalid context during reset.
> 4) Reset control imbalance
>=20
> The later 3 patches are enhancements to the WDT driver.
> 1) Adding error check for reset_control_deassert() and fixing
> reset_control imbalance.
> 2) Generate Parity error for WDT reset
> 3) Add support for set_timeout callback
>=20
> v4->v5:
>  * Updated commit description of patch#4
>  * Added Rb tag from Geert.
>  * Separated reset control imbalance from patch#4
>=20
> Biju Das (7):
>   watchdog: rzg2l_wdt: Fix 32bit overflow issue
>   watchdog: rzg2l_wdt: Fix Runtime PM usage
>   watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait context'
>   watchdog: rzg2l_wdt: Fix reset control imbalance
>   watchdog: rzg2l_wdt: Add error check for reset_control_deassert
>   watchdog: rzg2l_wdt: Use force reset for WDT reset
>   watchdog: rzg2l_wdt: Add set_timeout callback
>=20
>  drivers/watchdog/rzg2l_wdt.c | 83 ++++++++++++++++++++----------------
>  1 file changed, 47 insertions(+), 36 deletions(-)
>=20
> --
> 2.17.1


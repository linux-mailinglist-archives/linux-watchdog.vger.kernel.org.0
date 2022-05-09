Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 660B551FA43
	for <lists+linux-watchdog@lfdr.de>; Mon,  9 May 2022 12:46:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbiEIKru (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 9 May 2022 06:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbiEIKrs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 9 May 2022 06:47:48 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2135.outbound.protection.outlook.com [40.107.113.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C2CD1EE0A3;
        Mon,  9 May 2022 03:42:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJJCn0IzFzlzGhpv+QY7BwQaoqtBqh8keu/V2+JM8UVz8cIkJ1WX3G31KxAfmO+lmsABd+oGnrXqob0ooxCZ7D8QKM0glHCK7hBf3kGBTkF8FGAOz4ve24NXkmKdzFFlEdTlkQiW9XGZaaK7uYilmw9hBvb6PCvBdkLUpCrUACXCa1QaTzeB8LmYj4Ir5H3KpcpLU0tMG+n1jz2m06SY1h2NPAGhOj1cBHd1qWWi+TYaLHJd5oyGOaXZg/hSiiVUWr0jVcmp1DQ7bIKFGpAt9wqCgwgeKPbhjbfIuvzZqmBnpfVaJ9wMsoF+MBx9DKzXLU1Z2i9f2Olmr90J55jx6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lp5zkYD2p/m+MjSKxZnj7wJIZJ1fi2EL+d+DHnzvh+4=;
 b=Y0tP6/K69mfR1SyXN4o9axqHTQSbH83FmxKJVjqkY+wbUatumLLNryaEM8/MbGS+NUzBWthUYeaM8QJJJ3mwyx0hURkIeMqVCBHhWIAyIE8lFfOq/vBIRdEHxndzjxXYE8tgLUjdQUm8GUx7agTJutM9eTwa5BOO0Oaf7ysb/gJZh1T7nC9mS4+ps70TezOhWeDqDww3aqzjGaSQTfAtYXWsBLog4UKKLafPHULQti41f5GcZ7o8u+Y3m2zXO6cNvT1wVxAW193FBugt/XwgGLOuEBWhOF/oVpjVkp6spnshiQRUGVSmqaszDHUAxJN7SV/kP08pyOkHQ1uypTNoRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dm.renesas.com; dmarc=pass action=none
 header.from=dm.renesas.com; dkim=pass header.d=dm.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dm.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lp5zkYD2p/m+MjSKxZnj7wJIZJ1fi2EL+d+DHnzvh+4=;
 b=Hh5+MhfWmQzMCAWXfXTAOI8IFj06ZDKXn6TMhG1tzJmSSChGHmcVbiRnL3IqEzDQ+rHoB1OwcDgWXtEckRlwKFC2qce8hhtwpNKZV+DP73KGw6rbNzLJS3S3inccv9NkHSDubvhflnADegABT7wBoR/sv3UQ4hGIu59GjAzELjA=
Received: from OSAPR01MB5060.jpnprd01.prod.outlook.com (2603:1096:604:6e::17)
 by TYAPR01MB4271.jpnprd01.prod.outlook.com (2603:1096:404:c8::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Mon, 9 May
 2022 10:38:13 +0000
Received: from OSAPR01MB5060.jpnprd01.prod.outlook.com
 ([fe80::15ba:6d34:ba18:2a8a]) by OSAPR01MB5060.jpnprd01.prod.outlook.com
 ([fe80::15ba:6d34:ba18:2a8a%5]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 10:38:13 +0000
From:   DLG Adam Thomson <DLG-Adam.Thomson.Opensource@dm.renesas.com>
To:     Primoz Fiser <primoz.fiser@norik.com>,
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
Subject: RE: [PATCH 2/3] watchdog: da9063: optionally disable watchdog during
 suspend
Thread-Topic: [PATCH 2/3] watchdog: da9063: optionally disable watchdog during
 suspend
Thread-Index: AQHYVhplJ5kLDnzAaUyV7WjxlssYq60WV6RQ
Date:   Mon, 9 May 2022 10:38:12 +0000
Message-ID: <OSAPR01MB50604479A24C65CAD349104DB0C69@OSAPR01MB5060.jpnprd01.prod.outlook.com>
References: <20220422072713.3172345-1-primoz.fiser@norik.com>
 <20220422072713.3172345-2-primoz.fiser@norik.com>
In-Reply-To: <20220422072713.3172345-2-primoz.fiser@norik.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=dm.renesas.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db7cd728-5f88-4ed7-6731-08da31a804bc
x-ms-traffictypediagnostic: TYAPR01MB4271:EE_
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <TYAPR01MB42713CA4484911BB70237F89C1C69@TYAPR01MB4271.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SdM13DDRR+wdXOP8McLRM/6+LV0KEuQAPJweIy/UMHB/D3zpa9Vc5r4PmqE6oSkoWP+yoVv4t7U410m2tMqv/L4FY7OZsmdVrCvA1WxVH1q11iGuB0dDSj2FRQs7YY3/vxkvI4LBL9p0RTSvJEMeYr0J8jlh3kSViOA3Z1guIJeUsnMsiZMQ4T0ZiomroJaMxf38OaAeqxirDTKC5TOD1FqbrmvE401rqjNIJx9peKRPkYllc/ZTMWcinuwS/02uJ6ri/XwfJJk8ihvc1w2vnhJpvalmS6I9fF1NHfC9c7pvpgCxVDn1t59bI82c4CBEUvXx15DDKpGff4iiAAQUZ11O17G15DVCXoR9Vl+MuYvIi7JzKQo/1KCl26wYMH9zCLTx9iG/d8mFsVgOCcDLrqu9pXrcjHq7mVwywD6TFaUMCa+Qh0X/gBqQRYy1Gpd9jlfjeOYN1GfTGb7ypC6nwBBBEI2fhqyZ+vbptRkDvC5jPhqhfQWAafF26GyXrYsjFwWcznFXQ15DXjLzIa8iBEoBnOm2VpTY4DKSj3iW+EchR9RXReImZmC5RGshLY1BbyVqeDPcoP9w5pa+t8fuLyde19pkcIj2uahlXVYvAHsi6L+5/X+HeUuSHdN2ACS3wK7O3YkO15Yp72GM+t5WM79rZqbFcrbAgYlzAb7ieZK94uGEZL/kXr76xETzUT6yo7KxU9C+XOdA2ulG306mSQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB5060.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(33656002)(38100700002)(86362001)(52536014)(26005)(5660300002)(53546011)(38070700005)(6506007)(83380400001)(8936002)(7416002)(66556008)(64756008)(508600001)(9686003)(4744005)(110136005)(66446008)(55016003)(316002)(66476007)(76116006)(66946007)(4326008)(8676002)(54906003)(71200400001)(7696005)(186003)(15650500001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Z/+FFByN1JFKn76yNgax4Iz+6b93cdcUMgn2PbcueVGo80SJtkSuVOnP1DxG?=
 =?us-ascii?Q?VAH17F/H4YfGXM5uakm5Jawm8VMd/zYp/Ua7gjNwa+88fOYVpWu/RDsvq9a9?=
 =?us-ascii?Q?XbyxBWkv/81cz0wKnLVHkkxcENrxA88wQpk+4Wjfvyv+dyU3Pu9m8gqWZGTw?=
 =?us-ascii?Q?KzDem4VxnfCjQqnROsVD83ZxyymK4yufpGuQys4lR43cMPBfvHIaXG6xRe6Z?=
 =?us-ascii?Q?bIGD78ivKYgKZMEGDy3K8+V5SGmGIkGl68AX00uxkSr2aXhr+QE32mrjSj3w?=
 =?us-ascii?Q?7kALOYCSgfnZs7AIVRRWPhJEr2dUcokwXSp9hOwxKEYIpWIuXeaY/4SEThII?=
 =?us-ascii?Q?mFY+arKFGb3p90Ov/NzDMHNib2wg99oMT9w+D09oBOQAYDH5DjSL3FvWCikb?=
 =?us-ascii?Q?jHZJ2U+5qCbC2JRqeVKuVAc5/tJ3WCbkykV0NvnXWt8po3ww7T89xAc42QIA?=
 =?us-ascii?Q?BfMiwfuUhxw4/XtPlCnXfdrgIsu1KQiGY2Fgbxh1HgWdsrJt64jyuhixVRE4?=
 =?us-ascii?Q?Kw1K3unbilU7qKE9ayyZtaUH7o6jaLr0E23WuKwROHEq5D8dTJDrwJtqUJCZ?=
 =?us-ascii?Q?vGqCCmI8+UCPdlDXrqLdY8HrUpqGVFXQBjesdWPK8nT+jn2hqqhpZQdHIL9X?=
 =?us-ascii?Q?WCWnz2114Ne+0GJAVRYnaPBS9wPtYAZniVv4YaLUfXe9PSWWhQNSPCSMygq4?=
 =?us-ascii?Q?0rDkwD6WMx75/7pMz0ouix7a9zJeMUe/Tj4DK0fa/pdCcKIW/Q/VhEHeTJFV?=
 =?us-ascii?Q?690N0fq51WsgyrgTmIe2TA3M+HxAsr2P3Y9nh6ce4eOabsHCsDRWw6p2098Z?=
 =?us-ascii?Q?f0zhm9X5KUkmfMpSfW/wbfZKbFEgXNFiiEiHUlGqQ7toQi7VsK/Ta8vOlx2E?=
 =?us-ascii?Q?3ejkv32a3DfFjlg7V364WDbXLv1xlr9Buo5uBKkp93XO1zMC9M+w7mcoJHZq?=
 =?us-ascii?Q?52oXK6sf/1npiXNp/bNvsezJ3NgS4/KotwBdLT+68L46bUZ1GjFbI6qrnQx/?=
 =?us-ascii?Q?y15VAMMHU2rlOQkr3FPBhXuQVyJA734+euCh2xzbpDWtDiNPwvBYx2w6u+OU?=
 =?us-ascii?Q?xQrpaAl4QUPCa4tvFiYenUxchh9mCSX6++T5Biwyns4VfqKfirkMSlbTxiPO?=
 =?us-ascii?Q?ziOzgGy3i9ApkjsC0GZY5ouWLqpjXBk7ZuBGb90tOd2WxU+bEQ/BnLOswibB?=
 =?us-ascii?Q?KJiWK/z42aQevVLoI4TxEY3Cgvw3O6GkYPNLYzETvounLp5NEqdciFuiCveO?=
 =?us-ascii?Q?fyojWSqMgiHfj/XyVWVkGVWt18EhBbg53aL7hYFeBSOCkHcljjxAlW58mOxE?=
 =?us-ascii?Q?W8sPMDNG/MLz82FFyPuLdUC25WXdsKp1kdZdgqXfsRl31jlnRhKH4qN+mphE?=
 =?us-ascii?Q?ekRH4LL/z7IaVMxKUT++d+itHC486GII1TfHj7wFwLrhLZLYKB92SoRyW4xS?=
 =?us-ascii?Q?ujn03GeHp5rCPqREmRQUwV/h8aG367+1sYi4pH3xrEis9W4F9NjgbFfpMuk/?=
 =?us-ascii?Q?lgKbMIjeXtZ11Y6MjeNInnI6RXezOT9vlxIPl4+YhZhUGTcG1efPWjjL8bRB?=
 =?us-ascii?Q?0UnOkp3LYqE0R9tCW6PL0waRMc3WF55uJTuA/E9YXvF5OZVygrSmUWV9yOlV?=
 =?us-ascii?Q?FyMViEj6bBsVuiYqDJyKqTxPew7loV6DqiyvUsk13zJg5/NwBtfOP1SnmlLx?=
 =?us-ascii?Q?gT3dtONuf6TJdooqluHojSFki/QG/Td+2Ay9AR7A73OHWSovN/JiMio4d+Dj?=
 =?us-ascii?Q?r/j9ThfQz9Ta/3kcIQO05yw7qzan2TY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: dm.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB5060.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7cd728-5f88-4ed7-6731-08da31a804bc
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2022 10:38:12.9913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G3IlFzhYGTXAXZtES0M7SYiqSA+vbUn1cvstKFzcjeU18GVi/EuffmwmdiyMazXSB2z/g4zzazuiWI1nRomCAT3RCLRYsHERpPyBE3YEF4o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB4271
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 22 April 2022 08:27, Primoz Fiser wrote:

> Optionally disable watchdog during suspend (if enabled) and re-enable
> it upon resume.
> This enables boards to sleep without being interrupted by the watchdog.
>
> This patch is based on commit f6c98b08381c ("watchdog: da9062: add
> power management ops") and commit 8541673d2a5f ("watchdog: da9062: fix
> power management ops") and brings the same functionality to DA9063.

There's a WATCHDOG_PD bit (set to 0) to achieve this I believe, and thus
removes the need for the suspend/resume PM functions. Is this something you=
've
tried? Also seems to be present for DA9061/2 as well so can't remember why =
that
wasn't used there.

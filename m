Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9315E36700E
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Apr 2021 18:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238597AbhDUQ1n (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Apr 2021 12:27:43 -0400
Received: from mail-eopbgr30071.outbound.protection.outlook.com ([40.107.3.71]:30116
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235040AbhDUQ1m (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Apr 2021 12:27:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6Wcuyr/VDKcpVVPfNBedL47zlJKnLWUogo2oe84vXsxaW9GlrFCKJTsYUAwEZs1n2cCHbPeOwFu4chv4kBBmwoQnxs50T4lD4/tNIW35VRdZV7tox3dt5aH9hdiiQ+mlF7ETpaVpANoc3eFEIuzcOWyIeL06yPrH1wY5rAFDeNyigp1YoRSv5ac4A28DaX9foT5SPTEzKisDxArmywIeTzyVHsO5pI1vIrAysR0JfXfGBs8q/qDlum+fFWdv6wkmH7wQj0bRc0b324teld7/zQYIwhYi1M53qBJiKD+gDQstpchF7cWGanc4Yga//+B+23TSaOWX3GQ9zMidPHKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JfiFxw5i/OkXwrBs38xt/xxSuiUqEUhI14ht2dRefI=;
 b=nBWfmU88C48LfbS/FKRipZ96Y75zQw6zg1yi6QlfjBZZf+DMX4ecFWC6liKTAgA3YjjnjKEnVXx8j6XNmGqwEiSoRiTWrDRqx76SMEV0Yi2I5Qgo3GKrEsnXYardFIopfnbFYRBTriCkexnDs/3WpqI7uNcODkatSeaSuMoxxT19j/v0oU8+EovQFSUcVKJC2PRnYJ27u+v44CBKRPLeFvHX8j4nAuU4Yd7uGFOpXiLmS2Nf+mnwYJciFz3/GnzDtlIoChPlYb7Mu9j80yYis2Bd/2U9kwpuOcES45WPlR1QX0sNv0cHyXXwXaUHuyNJ4xqWWp3far+ei4kAu16/gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vimar.com; dmarc=pass action=none header.from=vimar.com;
 dkim=pass header.d=vimar.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Vimargroup.onmicrosoft.com; s=selector2-Vimargroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JfiFxw5i/OkXwrBs38xt/xxSuiUqEUhI14ht2dRefI=;
 b=K/038/JJu8ZP+g65t34qGoUfIGED04WlDsVSWPBMJD7XooxNNLp8Q/mTC9JXTrqn7L3krdSsehJjkofNg1szX28QcNHxUKk+NGai3NIqMcrfix2Qtx3aaE8jjZ26cNFd1YO1XWNKZNC5LBpv32tpLWFJa46KO8jXXiW7KsuU0p8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=vimar.com;
Received: from AM6PR08MB2981.eurprd08.prod.outlook.com (2603:10a6:209:44::22)
 by AM6PR08MB4533.eurprd08.prod.outlook.com (2603:10a6:20b:b5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 21 Apr
 2021 16:27:06 +0000
Received: from AM6PR08MB2981.eurprd08.prod.outlook.com
 ([fe80::9de3:7ce3:f155:8eda]) by AM6PR08MB2981.eurprd08.prod.outlook.com
 ([fe80::9de3:7ce3:f155:8eda%4]) with mapi id 15.20.4065.020; Wed, 21 Apr 2021
 16:27:06 +0000
From:   Francesco Zanella <francesco.zanella@vimar.com>
To:     linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
        linux@roeck-us.net
Cc:     devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org,
        Francesco Zanella <francesco.zanella@vimar.com>
Subject: [PATCH 0/2] GPIO WDT "start-at-boot" property
Date:   Wed, 21 Apr 2021 18:26:19 +0200
Message-Id: <20210421162621.24910-1-francesco.zanella@vimar.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-Originating-IP: [151.71.13.13]
X-ClientProxiedBy: ZR0P278CA0052.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::21) To AM6PR08MB2981.eurprd08.prod.outlook.com
 (2603:10a6:209:44::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (151.71.13.13) by ZR0P278CA0052.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:1d::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend Transport; Wed, 21 Apr 2021 16:27:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2d7e889-54a6-4e17-fc3f-08d904e24d46
X-MS-TrafficTypeDiagnostic: AM6PR08MB4533:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB45334C45DF03F224718BF656E9479@AM6PR08MB4533.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yTKmAglN5UOBdnUXmT+cI1QRASiAVHOPSNOau9jtUtaxFPL5LPUwsdG/lzrtblZwXQkf/i9Qrb0joWrHQ6doP9PHpnxBIDVt09+voFAoFfcetscS+jc///5Mwsu2gBcKGHe25Wfepgr6YpWXejhyOrMrRkXJbd6iQCzEhg/xyMjJVxa04w3Dw4QSeXRbT1+/shzNQj1noZ4358yLhriltsbLEUjF/PpHNy7ybVvAHqZP+v9w0H8RweAvWFIDR11vaQ1+vksP8Axm5uFJx9jAt13oNI9MfdSeCyRif3Yo/9ZlgBSIkcFupusqoyj33FqBQEuwL5UfrsFPo+oMQEJZX6hqkqZbFcPKKZl+bGRPB8REk38qD3eFXiUx3GPNeSCCDmM17VCaRTHLuzu8Ts6/jBpC4YPTzDXZyvljfrvBsiPGvTTTvkQAOb5BbF0dR3brzRhwn9U2k6U1GbLMayNn3qJ5FWY7Vy6RWMfUw/LQaNy7bGYi/lQNjJnI81K7AzZO37+2EHgjNTzvRYeafYuJvu0Ow8IEYdt6Htd397L51B6l8zdhgEvhdSSCP9/92YO/S0fCPJMu9TFjpqZzZxKghR8oJ0ejHhoWXHEQg5yzzpmN3SeRfK2B5go8JwH67fUG/07xYJpikQDyFvpnrvriq76aQsDs9XUNESPsblVZkRLuUs5wa2seop/qc8pmZYRR
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB2981.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39840400004)(396003)(376002)(366004)(86362001)(38100700002)(66556008)(44832011)(6486002)(8676002)(2906002)(38350700002)(4326008)(6512007)(6666004)(478600001)(83380400001)(107886003)(66946007)(66476007)(6506007)(1076003)(5660300002)(4744005)(186003)(8936002)(16526019)(956004)(26005)(2616005)(36756003)(316002)(52116002)(69590400013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yQ73NZMKgyZsz9WrHGr7FEOCmI+GnQKYp7jMXuZ96Sgfuv/upafPqPiOiZCO?=
 =?us-ascii?Q?VJyxZxkDi3KssFgD3Vo/SwXzhGUAAvETWvGEDPDbTjNMPbQM77GWJmkVXmZj?=
 =?us-ascii?Q?FGDYHRAaWYE2GkYONqRH52OdAcbCEP+h4Da6+Rt65p0UuCaHmhZr0Bj9CR/n?=
 =?us-ascii?Q?nOJ7cf3P4u62L0F9fpk8yojK/tml6z/X+z5gxI0KJA0UT4X8F78EfvFMO1Tf?=
 =?us-ascii?Q?u/NB1m//d/nllrh0D0oyyro0S+6e2ZAB1fy1JKQVfCfBLHSu7D0Kv/FjgSH1?=
 =?us-ascii?Q?wnEAtlTGY68+Y6/G5aVh3nEqiRd0ChtV9D4k+9vS6h29gssfqNomrVQMpvu8?=
 =?us-ascii?Q?YYPNWAqtl52supUXqrJ1S/7PZMeiux2FW38YBcwtJosgYJQDz5FqQX11vti2?=
 =?us-ascii?Q?WZxxm5DoG0Gg/JCuILF2el4KA2MeLVNch+XgUfoIXBLjXl2i9TxCQ6JY6l4y?=
 =?us-ascii?Q?hWOfkZ2rnuekaOitLaUcoOT5zAjfg3BDPVdR5nDi9/qh/JWtjg2uKfJw1vEg?=
 =?us-ascii?Q?3f6ueE/A/iDtVgqboVlIN3b+ny0xfIxcqwRk3L4ILRd+g3w0Zusrm4HK4dTf?=
 =?us-ascii?Q?AuvF8KWdWki4FXRuNrnVl3+HiAf6+W/XgrEDhaSJVxD/+DUBdajuuNQuPe3F?=
 =?us-ascii?Q?cGe6dVXaq9gkWu5723CV9WOi+VRenUDRJxMMY3pB2wOo97HqiAGXTew3sbZn?=
 =?us-ascii?Q?LzMUGs+iIs/ik41Sh9Mg3mecvIRgmwN7aCNWFLAmpwsH+m7ThCEKIEgT3kAH?=
 =?us-ascii?Q?W8THFfRXHOuYYOQcs8pnNxUFphgRdmd/SbXArdyvdb4GRoDLMGNUuaIIBUGK?=
 =?us-ascii?Q?qDUbRf1tC953euKbpeHefUDyjAgIEESsWTUjuELYEWrGDekqf4GC1fWJpBpC?=
 =?us-ascii?Q?alamC1ZEhSBQvUqOhEZqdVnzewT1uFBj50+AmAmXlPSv4SAc6VaohzL+HK/f?=
 =?us-ascii?Q?J5qFu/zZ8fKQmthOcu4rvFXSV7ea2ho9/58G6Xwc151f7bqk+RkGibVdLoJc?=
 =?us-ascii?Q?IQO5EnTy4d1Ie5NDOs36uiXiqj5Scnq2KmGihieG7Vk3VBIlysi4BwNknD+n?=
 =?us-ascii?Q?H+TJMSVvuwe1Ndh2UFZYCeSrE6GUYk9/02RE2xbF8nzAYukK04WV6OjDoUPq?=
 =?us-ascii?Q?4jzC05dqU7ygOzsl2iI1Aw775qWw9OuRWwzV9nbvaEoRMnecI4c5rXfit3Vw?=
 =?us-ascii?Q?xXxFflWdVrzrMUg0PWO/AQKkUqVAJ0lYZo+7XZf7Dv7VUOyJMUKO+Q6ILViI?=
 =?us-ascii?Q?eZa9KwzRIetanXxDsTcUpETzKsCa0Gu3RvR9uMgdDjlR9jbmqMBCII/xmkzh?=
 =?us-ascii?Q?Rf9aBuT4F/mz9tUFtW1nP9Eo?=
X-OriginatorOrg: vimar.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d7e889-54a6-4e17-fc3f-08d904e24d46
X-MS-Exchange-CrossTenant-AuthSource: AM6PR08MB2981.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 16:27:06.1270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: a1f008bc-d59b-4c66-8f87-60fd9af15c7f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjtFPOsyCpgmqXsdVk3HK+y9z/k7/8sB3JLrw0gZ4e0qDcHJoIUA5a6TLacDQU7vWmIcuSg3ERZJ42/NTYTjbo9Wslnv9A7OvOXukJiBGyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4533
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

I propose to add a new property to GPIO WDT device tree binding
"start-at-boot".
If this property is present, start pinging hw watchdog at probe, in order
to take advantage of kernel configs:
- WATCHDOG_HANDLE_BOOT_ENABLED: Avoid possible reboot if hw watchdog was
  been enabled before the kernel (by uboot for example) and userspace
  doesn't take control of /dev/watchdog in time;
- WATCHDOG_OPEN_TIMEOUT: Reboot if userspace doesn't take control of
  /dev/watchdog within the timeout.

Francesco Zanella (2):
  dt-bindings: watchdog: gpio-wdt: add "start-at-boot"
  watchdog: gpio_wdt: add "start-at-boot" feature

 Documentation/devicetree/bindings/watchdog/gpio-wdt.txt | 7 +++++++
 drivers/watchdog/gpio_wdt.c                             | 6 +++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.17.1


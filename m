Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6AD60583
	for <lists+linux-watchdog@lfdr.de>; Fri,  5 Jul 2019 13:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727853AbfGELqF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 5 Jul 2019 07:46:05 -0400
Received: from mail-eopbgr150055.outbound.protection.outlook.com ([40.107.15.55]:29927
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727609AbfGELqF (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 5 Jul 2019 07:46:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4Qhh6fe2T3Wi+U+FztweYErnUG7cfu2TfeBuO7JZos=;
 b=TP1ZXcGgw3Q4COalEs+Xfe8FFVDJOrCs2gQ5nI9dLsreIYby33vnkkA7rSKTcXpA5zriraJNruU172zkhmzp7vPFftOkS1UFuB21GwvRTa2cVj+Z1ZSNNa9fHO5VVcxjs+L4nablwxs/47t5Fn+M6rUO+XL8m7A0oYr+aVnAXy0=
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com (52.133.60.17) by
 AM0PR06MB5891.eurprd06.prod.outlook.com (20.178.112.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Fri, 5 Jul 2019 11:46:01 +0000
Received: from AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9]) by AM0PR06MB4066.eurprd06.prod.outlook.com
 ([fe80::141f:c11a:799e:97f9%7]) with mapi id 15.20.2052.010; Fri, 5 Jul 2019
 11:46:01 +0000
From:   Melin Tomas <tomas.melin@vaisala.com>
To:     "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>
CC:     "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Melin Tomas <tomas.melin@vaisala.com>
Subject: [PATCH v2 0/4] watchdog: cadence_wdt: Support all available prescaler
 values
Thread-Topic: [PATCH v2 0/4] watchdog: cadence_wdt: Support all available
 prescaler values
Thread-Index: AQHVMyc4B6U2dJgBDUK25JQy4YbItg==
Date:   Fri, 5 Jul 2019 11:46:01 +0000
Message-ID: <20190705114522.42565-1-tomas.melin@vaisala.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0901CA0051.eurprd09.prod.outlook.com
 (2603:10a6:3:45::19) To AM0PR06MB4066.eurprd06.prod.outlook.com
 (2603:10a6:208:b8::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=tomas.melin@vaisala.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.2
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0239449d-47f1-43f3-e668-08d7013e5a64
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:AM0PR06MB5891;
x-ms-traffictypediagnostic: AM0PR06MB5891:
x-microsoft-antispam-prvs: <AM0PR06MB589171D60DA0B851E7C17269FDF50@AM0PR06MB5891.eurprd06.prod.outlook.com>
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(979002)(396003)(136003)(346002)(376002)(39850400004)(366004)(199004)(189003)(52116002)(53936002)(6512007)(6436002)(66066001)(6506007)(25786009)(386003)(6486002)(478600001)(3846002)(6116002)(2501003)(68736007)(50226002)(99286004)(107886003)(36756003)(26005)(316002)(4326008)(102836004)(54906003)(110136005)(186003)(71190400001)(71200400001)(5660300002)(2906002)(7736002)(4744005)(305945005)(14444005)(476003)(2616005)(1076003)(8936002)(66476007)(66556008)(64756008)(66446008)(86362001)(8676002)(256004)(486006)(73956011)(66946007)(81166006)(14454004)(81156014)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR06MB5891;H:AM0PR06MB4066.eurprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: vaisala.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Tc/OGtIgqgkVmyH8S3xTCGtjRCl8NqICj4PQbZQd2wZ4Obu3TtfEKIkxtJql4RBBN0/sGAHGav305ZmMUmHwDk00LrpacxndPJskclg9lLDe0eZPy+UpI0psUpwaenln4wzz7IjuBojiuk53FAaiXf73Fl1dOgRA9Gvj36ppS5oOEIiskkmKCvUYBZL9T76xnbiLEF3u82pqvepzpIYlqfyr2Z8Lqe7pDV9zcNnoeV9iTHstJHRmUj1X1LSJRHtwP6WZRswr0TfZ1Db9SrLm/A2Nxu79FnxXUSEYD2BKHakwTnY4OXLs8V+vl9B/6/uys93CwtAqjjzwsycXi7SB1timfLiJkXRjD0/juw3cER5WMHn438JUZdKOHCmjlAUgD4F1x/OqZTPOlB5maeV5IyrnuULgzY8+0olcNwKlnNk=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0239449d-47f1-43f3-e668-08d7013e5a64
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 11:46:01.4985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tomas.melin@vaisala.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB5891
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Cadence watchdog HW supports prescaler values of 8, 64, 512 and 4096,
currently only 512 and 4096 are used by driver.

This series adds support to select prescaler values of 8 and 64 for
lower input clock frequencies.

Changes v2:

- Add calculation of actual min/max timeout values
- Validate input clock frequencies to not allow
  frequencies that would result in timeout granularity
  of > 1 second.

Tomas Melin (4):
  watchdog: cadence_wdt: Move clock detection eariler in probe
  watchdog: cadence_wdt: Calculate actual timeout limits
  watchdog: cadence_wdt: Group struct member init statements
  watchdog: cadence_wdt: Support all available prescaler values

 drivers/watchdog/cadence_wdt.c | 65 ++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 27 deletions(-)

--=20
2.17.2


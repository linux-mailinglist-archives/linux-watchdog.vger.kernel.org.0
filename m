Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44FD545B7B5
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Nov 2021 10:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238420AbhKXJsQ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 24 Nov 2021 04:48:16 -0500
Received: from mail-eopbgr10059.outbound.protection.outlook.com ([40.107.1.59]:23287
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239010AbhKXJsO (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 24 Nov 2021 04:48:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oDrxmHqRAtyATW9tuKEh94DvhpumwT6xBmmxEEHgUMBmKuPlkFNbYV7y23zrz+63MeB8Fc4DedtLzyDyHv5yIKtDMzVFiqj3UCMAiEMgOtBXmOJrm59wG0mcRybipDoiYCrsmHduksn1L9AEchXhQf3/yhUe3viPpxpyOpvO+RlQWYiWHdksvsGljowJLoEhrnnoOlVcAmCl2CFuo5KH1aAE+MXNON5erge/LLm+DhQ9nH4saTXBSQV6YW8P9Lyo7WlfiRe+xINNK2OY9yiKgkLu12OAsblMHIjXNTJ78lh14l3a02emSkJJ0R3wyA57fsWUTwoNIyEVS91K+sjb+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oe3LWgCYxlBtRsJhyRxKUagDkaTA/ZaGj/+qT5hdgOM=;
 b=N1xPLX4ooCzI7ax1AUVBEQB0fQ9uZnMkUdhYu6kKtwxibBk4cMOHLfajtWSqO4vCBsV3C8NJR+V6Oi1lpnjjETtyumGsTXQlMZdE5ABcuUtQVH3Vq1fUANr1NPDvN5NyrAbEAmnvPt/Ocn9+qElwOUa36bE73b4+t/2O4fdPdqntGJo5bEABlt3HEigN/4KamnltEWzSMd7n17zbjm1l2yXmO/mKcXVu3RTy/EIul4A6YxKLNxVcApfwLsr+6NGlbAT3qek9Hv+xaUYom4qjQ+EsBLiEiu6l5/VBA+wEmHpUS18kfavjjbJZOlNuy5Af7TroXulkuJ1UeoKzf3KXTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=diasemi.com; dmarc=pass action=none header.from=diasemi.com;
 dkim=pass header.d=diasemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dialogsemiconductor.onmicrosoft.com;
 s=selector1-dialogsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oe3LWgCYxlBtRsJhyRxKUagDkaTA/ZaGj/+qT5hdgOM=;
 b=Sg5MeUzz5sHE9+6OC0Ol1gr4SOzazGrobmr17Q+tjGXDcjRt4cvQWKF67SOoa8Kp//ph3IvHVE0D6vCXAkULoAvhkkZzit2Co3+srtcxJFMtJX3u24BxbpUnsSB3OoV6LaJbfuUxTbCqQaYKeCXyc3tglXNZW8f6TBzUCx50fmk=
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:255::23)
 by DB6PR1001MB1045.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:58::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 09:44:56 +0000
Received: from DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::852d:c54f:8414:3276]) by DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::852d:c54f:8414:3276%3]) with mapi id 15.20.4734.020; Wed, 24 Nov 2021
 09:44:56 +0000
From:   Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
To:     Andrej Picej <andrej.picej@norik.com>,
        Support Opensource <Support.Opensource@diasemi.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
CC:     "y.bas@phytec.de" <y.bas@phytec.de>
Subject: RE: [PATCH] watchdog: da9063: use atomic safe i2c transfer in reset
 handler
Thread-Topic: [PATCH] watchdog: da9063: use atomic safe i2c transfer in reset
 handler
Thread-Index: AQHX4QpHjubMVjKJ1E6vZmOITLmPsawSbWOQ
Date:   Wed, 24 Nov 2021 09:44:56 +0000
Message-ID: <DB9PR10MB465259F277D405481760797B80619@DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM>
References: <20211124080654.2601135-1-andrej.picej@norik.com>
In-Reply-To: <20211124080654.2601135-1-andrej.picej@norik.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=diasemi.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07564e62-62e2-4349-488d-08d9af2f12e3
x-ms-traffictypediagnostic: DB6PR1001MB1045:
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-microsoft-antispam-prvs: <DB6PR1001MB1045C88838A460EFD7B21ECFA7619@DB6PR1001MB1045.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:159;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9As1ot1znGct7H/tdaAn8m5dHpJ/cAOikbG1MpYp9dwjGsSr7SJ0RaYvjWeDJrvuoSH/ORQm54T5a91ohakxDbRSJ2I5R4DMaHq5mKpEnd9wMYgZf7m4mXDwiek66cNkX1fsfzFzpdMucHQwhJqLl9KZ35Hh1A4qbSWVLD4TNF2gCuh7Kdlyi350fHNPDe+zIpMH7UHeoK3F9JKfj1l1LawBiDk6bcIUk5kerJuckSa7cmAZQ6WBbjVM73tGK/87mFqjltmSB/Bk55l+qBToJNwTpcLJgmNtNBpTUN5uPg8/O2oWs0YdkK9JzxzjrYJY6ltllA+8/nomy9mKFTvycPpDfUzhaTuSU3CRN4ZCnodaRKELSEHvY/RYJnzP0aCfygmAX0oiuMlyYyMx8QEgFjDGrgk3MVx93lRjhmBN5tOU3kNBlyFrV71htf0touSVG5VSPTbT+jIbgPn24LseOzVYjFTij6UtMJ2eYJLROV24v+oCRjhAsKAjXdAhPbDLq9LCmIl3Lp7ycP9GKBPrFuSGmyu7gYcuW1EGpYSWKanieyfHn8fIdJkclHUc6xhA5B4jwWReIrqsmMxoLMQyIDVf8Ai5Gic4h0sPkkXDHmyL+ifv12leeB3dmiFgNOf8TPR+Wv8dGa5fvoMmLUOhsvGZqJHVBPAkRMdCOIlVCKoDAPi4CN2YrV42E+VZwyEZPGBmZDubQij1npERJZZHxQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(76116006)(66476007)(64756008)(66556008)(66446008)(66946007)(53546011)(7696005)(6506007)(38070700005)(55236004)(122000001)(186003)(316002)(71200400001)(4744005)(4326008)(26005)(508600001)(52536014)(38100700002)(110136005)(55016003)(5660300002)(33656002)(2906002)(86362001)(9686003)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pWxxf8Kzs8T6Qo/TbdNgFYx69aCD221g/queYgTOJ0+46VO5nuHHI8mBFLpL?=
 =?us-ascii?Q?VkwF0qyebFCrTS3jZGqqHpgKA76BS94dzCAMMDRAtIX/vdMqeoxKkZKWeRdg?=
 =?us-ascii?Q?1Gif3xUflgrEsc5Ph6x/3wluNdPfSlGpBPvU12t1ArLAUAlA1rUWJWw3aDHd?=
 =?us-ascii?Q?/HNGa2tv8vuR/85DsG+tH9XF7WmgogKP5i1R4ms5n1i+JnN5jlgBFJNftmqf?=
 =?us-ascii?Q?VDre7vCxjeuwm5HVLapWKTLkmh3PI5vt658t+9wt8v1312Ufboxn06xlQVtT?=
 =?us-ascii?Q?9xa/VRd7YE955Yd2Yfk+1xhi45umpuQMtVbxjSL85XPdCVpcizDoc/bVZEQw?=
 =?us-ascii?Q?iXso3zmGr2fTIjIYm/FGCfdrjy8bpXAuLMXoGXiMu1xuBHK8UYMbKUMvgfoy?=
 =?us-ascii?Q?T1/XTrQa5cDpdtJqQpPTFzny5Xn0DlVD529fDFRx1OPtjGGjqGXb/XvvNwRT?=
 =?us-ascii?Q?Teq+V+gYfQXjTQse53uI2MyUP1oQN/1EPcNi2UuyvcS/sCvbyRXYgDXc3vRH?=
 =?us-ascii?Q?CgZq4bjtz0s6Jy7dt633ksqOInEYviuEhj+ZnYe8B7uVxyuPU3/f/IRlGuBZ?=
 =?us-ascii?Q?UoUZEvn5BYA57eRvo27/l10BM3w+ftKaraXW/ExKZxbhJSu76THtxEzIYGv5?=
 =?us-ascii?Q?WS3qLHXubmNLcsANDLvjefFDzljxMyXCq6SrGD5SaVOmwb8W6mh4SbhGXOoS?=
 =?us-ascii?Q?7RYbsIZp6WUKbHaswsHIMtQ64RKsryvPzYPWJIMGRIbTJBz2b7/TR6q6lkQZ?=
 =?us-ascii?Q?OQQNp1b+lR3ywa5NuKSBaA7NDiLVU6Fy783Hc/4xJjaMWAVJPkjWw7hY5NIu?=
 =?us-ascii?Q?rm7ufpZI7ReMjz+qYvFaA86tcZr3bvDpuUgO3/V1q3fDDaryL3ht43AoBW1K?=
 =?us-ascii?Q?sRSWhrp/8uJvuXgSPwZ7i/SxClo3jR8OFm2lW/cgkGAUJgc7RyJhSSCWEEFH?=
 =?us-ascii?Q?9/s/5FlHfDaN+P7IH9pIxBPb7SbBWhtSGI6lErp8LD7hJY6VPsWWxgL7U5xI?=
 =?us-ascii?Q?uoTPg0rLpijzJoO1uOv9Zko51naXhLRwAzi9BpQPubalbK40Bt6q5l2B8P/L?=
 =?us-ascii?Q?NvApImLL7XjMCOcU/kb0yQ0jmRn2lJNFqCP0GEuc8G4M0OzHFgkVrRKNUPhs?=
 =?us-ascii?Q?P/Hhi0A7+ptuhn9tvsRjpkNvsrqLsNSgr9pbqz+YUHxME2Ix9yNUEuYPCik/?=
 =?us-ascii?Q?ky5OSVhgRkgm5pvHglRd/OtxAaYIf/WgxOMJvGFPV+K2l8NmDlA4vz5vlHte?=
 =?us-ascii?Q?GxSJpzVSCe1VV/xTV7KQHc1vPo9SIJFFycu9sU2g/ksdSRig9iVM7JK0wOfa?=
 =?us-ascii?Q?VzXEWa4kouvNimptkPO+qQhLL2DaoX/Kc7Pc2ZVVwqDnuis2Iqm3uepxkDcN?=
 =?us-ascii?Q?VCJhrOrEdDQC8D5AM8VQvhC0TS0EeZPF/uFnV4PlQPMNvqU5AHJNObXCn/hQ?=
 =?us-ascii?Q?2XiM236++d4Mm6TFbxXk3PCP22wsuLZ7rFfTL4SYdKoStrqfLO6Ge6n1dohi?=
 =?us-ascii?Q?txJKu1SkM4hmHhxPG2kZXkdEVS21uCrbbr+vqkFbd2eb1M+jO1AmYbOkhO3d?=
 =?us-ascii?Q?ZQ6mr2WvbKpxa3a99//o6abWqFtyl7DK8+pe/lhwMcg1H39S60FmrwaUjyDJ?=
 =?us-ascii?Q?4dJG7SSVATjhMFIWOBAGNEYQOoKXBervfRhgc93s2neiWoG+v8L73AvexUGP?=
 =?us-ascii?Q?G/XeAQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: diasemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB4652.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 07564e62-62e2-4349-488d-08d9af2f12e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 09:44:56.3649
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 511e3c0e-ee96-486e-a2ec-e272ffa37b7c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: myoLYtF5Rk6kHgE/RT/iafAaPR4fdbQJLtNknDO2gzuQOrrfA56wb6YsUt8tZLJ1IsZgrdDNwgQFNutGH7MhGbl42/dupYoRQtvWu3SIDkU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR1001MB1045
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 24 November 2021 08:07, Andrej Picej wrote:

> From: Yunus Bas <y.bas@phytec.de>
>=20
> This patch is based on commit 057b52b4b3d5 ("watchdog: da9062: make resta=
rt
> handler atomic safe"), which uses the atomic transfer capability of the
> i2c framework.
>=20
> Signed-off-by: Yunus Bas <y.bas@phytec.de>
> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
> ---

Reviewed-by: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>

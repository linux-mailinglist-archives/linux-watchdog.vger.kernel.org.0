Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B476F52205D
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 May 2022 17:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346982AbiEJQAg (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 May 2022 12:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346914AbiEJP7Z (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 May 2022 11:59:25 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44D6205F2C
        for <linux-watchdog@vger.kernel.org>; Tue, 10 May 2022 08:52:02 -0700 (PDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24ADi6gR006526;
        Tue, 10 May 2022 15:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=YDd6OZXv2IhY89DoNwrsbV7EIxit9b1/NeOdxHc35Hk=;
 b=L00vcVvRttIXpVeDsQ9AzhLKcpX+ztR7y4+afvGKDu3Ql1KAeBoBYHCyLqUbrX+f23YU
 Nr96NCSnBCDcMUW8PuOQGhmS3WtOkFuzbdHDUi4td/6UFQHYWly3h/MTiyD22PnsuYLg
 nz1jB/WsV78tZH+kPQsTv3M29EqiSG19mpEA6grHCGUh+Kk+8OVgc5Kil8+uw1dUZQsX
 2bWjuO59cPyN1JpzKwoAtXpb7zVCyG8JVuUop3wkq08ezSJwRZhcFzgCIX8sYGsFVK2h
 QZP35+iSh0vHht1Z3v+CsobgEfCXzANCh7k39Glp77nUwUd60vPCnvqd0YYDAwc0TMyT CQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fypp0xqy5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 May 2022 15:51:46 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24AFUHaK019644;
        Tue, 10 May 2022 15:51:46 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fypp0xqxp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 May 2022 15:51:46 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24AFX3ND018162;
        Tue, 10 May 2022 15:51:45 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
        by ppma03wdc.us.ibm.com with ESMTP id 3fwgd9e278-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 May 2022 15:51:45 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24AFphca26411280
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 May 2022 15:51:43 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9723BB2066;
        Tue, 10 May 2022 15:51:43 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D020CB2067;
        Tue, 10 May 2022 15:51:42 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.24.13.37])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
        Tue, 10 May 2022 15:51:42 +0000 (GMT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [RFC v2 2/2] watchdog: pseries-wdt: initial support for PAPR
 virtual watchdog timers
From:   Scott Cheloha <cheloha@linux.ibm.com>
In-Reply-To: <YnnPdv+Hh9UEHMu/@google.com>
Date:   Tue, 10 May 2022 10:48:59 -0500
Cc:     linux-watchdog@vger.kernel.org, linux@roeck-us.net,
        brking@linux.ibm.com, Nathan Lynch <nathanl@linux.ibm.com>,
        aik@ozlabs.ru, npiggin@gmail.com, vaishnavi@linux.ibm.com,
        wvoigt@us.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <7D3AFBE4-ECDF-4CBC-9B3F-55AD62C18A3C@linux.ibm.com>
References: <20220509174357.5448-1-cheloha@linux.ibm.com>
 <20220509174357.5448-3-cheloha@linux.ibm.com> <YnnPdv+Hh9UEHMu/@google.com>
To:     Tzung-Bi Shih <tzungbi@kernel.org>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qS5oTfGSv2iHgUYrVecSeN8pC1a-9eAJ
X-Proofpoint-ORIG-GUID: u3tJsc2C-Eta8a4gFAyIS0rPvrgvOZ5G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_04,2022-05-10_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 spamscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205100070
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

> On May 9, 2022, at 9:35 PM, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>=20
> On Mon, May 09, 2022 at 12:43:57PM -0500, Scott Cheloha wrote:
>> +#define SETFIELD(_v, _b, _e)	\
>> +    (((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK((_b), =
(_e)))
>> +#define GETFIELD(_v, _b, _e)	\
>> +    (((unsigned long)(_v) & PPC_BITMASK((_b), (_e))) >> =
PPC_BITLSHIFT(_e))
>=20
> =46rom `./scripts/checkpatch.pl --strict`:
> WARNING: please, no spaces at the start of a line
>=20
>> +#define PSERIES_WDTQL_MUST_STOP       	1
>=20
> =46rom `./scripts/checkpatch.pl --strict`:
> WARNING: please, no space before tabs
>=20
>> +static const struct kernel_param_ops action_ops =3D { .set =3D =
action_set };
>> +module_param_cb(action, &action_ops, NULL, S_IRUGO);
>=20
> =46rom `./scripts/checkpatch.pl --strict`:
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider =
using
> octal permissions '0444'.
>=20
>> +MODULE_PARM_DESC(action, "Action taken when watchdog expires: =
\"hard-poweroff\", \"hard-restart\", or \"dump-restart\" =
(default=3D\"hard-restart\")");
>=20
> The line exceeds 100 columns.

I was under the impression that strings were an exception to the
line-length rule.  Is that not the case?

`scripts/checkpatch.pl --strict` complains if I break the string up:

WARNING: quoted string split across lines
#162: FILE: drivers/watchdog/pseries-wdt.c:162:
+MODULE_PARM_DESC(action, "Action taken when watchdog expires: "
+		 "\"hard-poweroff\", \"hard-restart\", or =
\"dump-restart\" "

WARNING: quoted string split across lines
#163: FILE: drivers/watchdog/pseries-wdt.c:163:
+		 "\"hard-poweroff\", \"hard-restart\", or =
\"dump-restart\" "
+		 "(default=3D\"hard-restart\")");

>> +static bool nowayout =3D WATCHDOG_NOWAYOUT;
>> +module_param(nowayout, bool, S_IRUGO);
>=20
> =46rom `./scripts/checkpatch.pl --strict`:
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider =
using
> octal permissions '0444'.
>=20
>> +MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started =
(default=3D" __MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
>=20
> =46rom `./scripts/checkpatch.pl --strict`, the line exceeds 100 =
columns.

>=20
>> +#define WATCHDOG_TIMEOUT 60
>> +static unsigned int timeout =3D WATCHDOG_TIMEOUT;
>> +module_param(timeout, uint, S_IRUGO);
>=20
> =46rom `./scripts/checkpatch.pl --strict`:
> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider =
using
> octal permissions '0444'.
>=20
>> +MODULE_PARM_DESC(timeout, "Initial watchdog timeout in seconds =
(default=3D" __MODULE_STRING(WATCHDOG_TIMEOUT) ")");
>=20
> =46rom `./scripts/checkpatch.pl --strict`, the line exceeds 100 =
columns.
>=20
>> +struct pseries_wdt {
>> +	struct watchdog_device wd;
>> +	unsigned long num;		/* NB: Watchdog numbers are =
1-based */
>=20
> What does NB stand for?  Could it be removed from the comment?

Sure, removed.

> Does `timer_id` or some other equivalent names make more sense for the
> variable?

The hardware documentation calls the parameter "watchdogNumber", so
I think "num" is better than "id" in this case.


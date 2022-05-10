Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB7D5220DC
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 May 2022 18:15:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243286AbiEJQT1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 10 May 2022 12:19:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347160AbiEJQTY (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 10 May 2022 12:19:24 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1ACB270CBD
        for <linux-watchdog@vger.kernel.org>; Tue, 10 May 2022 09:15:26 -0700 (PDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24AFpsGR028407;
        Tue, 10 May 2022 16:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=X7Trc+qJoV8eKz3LAaHRwCxqbw7yQK/52/lEfZijh0c=;
 b=M/HX8R5aYkvDiOl+dOI1mN3EPaiRKOtiL/bEQaU9540KzjaCIjzg7nudKSBZCdwXhzBX
 +22ZNgPBGfdF+rF9I1R0RjEvc9Rs9l85PuRK3yA+LnPvzL0GOJnYdAXxRQ7fE2ShQAXC
 HogcrRqBDLNttq/qs9hj0NRxk42WUEkIXcEh7X7BlNseqtNdIQ0OS+6AocAi721+Dard
 O0hhTvBt1ZCCrm27nBdFxZJs+6L/NH1uwAa/Dapho13kfBX62dkCO2JStvWigqjGq4Lt
 YjHlV+auw6kMrImivTW2tkJVEyeO6Nwre1C8zUohBtej1Abk0WxfGpcQ/yNNXd+ILD0v RQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fyrvev5ka-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 May 2022 16:15:06 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24AFs8rE032659;
        Tue, 10 May 2022 16:15:06 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fyrvev5k3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 May 2022 16:15:06 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24AFx1vD016589;
        Tue, 10 May 2022 16:15:05 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
        by ppma01dal.us.ibm.com with ESMTP id 3fwgdakmhx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 10 May 2022 16:15:05 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com [9.57.199.108])
        by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24AGF3qG25231634
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 May 2022 16:15:03 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1856DB2068;
        Tue, 10 May 2022 16:15:03 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 84077B2065;
        Tue, 10 May 2022 16:15:02 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.24.13.37])
        by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTPS;
        Tue, 10 May 2022 16:15:02 +0000 (GMT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.80.82.1.1\))
Subject: Re: [RFC v2 2/2] watchdog: pseries-wdt: initial support for PAPR
 virtual watchdog timers
From:   Scott Cheloha <cheloha@linux.ibm.com>
In-Reply-To: <628a1540-4768-61ca-27e1-b6507cc00086@roeck-us.net>
Date:   Tue, 10 May 2022 11:15:01 -0500
Cc:     Tzung-Bi Shih <tzungbi@kernel.org>, linux-watchdog@vger.kernel.org,
        brking@linux.ibm.com, Nathan Lynch <nathanl@linux.ibm.com>,
        aik@ozlabs.ru, npiggin@gmail.com, vaishnavi@linux.ibm.com,
        wvoigt@us.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <E5A89482-D089-4634-9FC0-78464D00F968@linux.ibm.com>
References: <20220509174357.5448-1-cheloha@linux.ibm.com>
 <20220509174357.5448-3-cheloha@linux.ibm.com> <YnnPdv+Hh9UEHMu/@google.com>
 <7D3AFBE4-ECDF-4CBC-9B3F-55AD62C18A3C@linux.ibm.com>
 <628a1540-4768-61ca-27e1-b6507cc00086@roeck-us.net>
To:     Guenter Roeck <linux@roeck-us.net>
X-Mailer: Apple Mail (2.3696.80.82.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ukwdz2xUr72KKj0ttvV634c_5g-iACj8
X-Proofpoint-GUID: Xo_8q3_GRnsRCeEb05GSxlN92RdxgtTa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_04,2022-05-10_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205100071
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



> On May 10, 2022, at 11:04 AM, Guenter Roeck <linux@roeck-us.net> =
wrote:
>=20
> On 5/10/22 08:48, Scott Cheloha wrote:
>>> On May 9, 2022, at 9:35 PM, Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>>>=20
>>> On Mon, May 09, 2022 at 12:43:57PM -0500, Scott Cheloha wrote:
>>>> +#define SETFIELD(_v, _b, _e)	\
>>>> + (((unsigned long)(_v) << PPC_BITLSHIFT(_e)) & PPC_BITMASK((_b), =
(_e)))
>>>> +#define GETFIELD(_v, _b, _e)	\
>>>> + (((unsigned long)(_v) & PPC_BITMASK((_b), (_e))) >> =
PPC_BITLSHIFT(_e))
>>>=20
>>> =46rom `./scripts/checkpatch.pl --strict`:
>>> WARNING: please, no spaces at the start of a line
>>>=20
>>>> +#define PSERIES_WDTQL_MUST_STOP 	1
>>>=20
>>> =46rom `./scripts/checkpatch.pl --strict`:
>>> WARNING: please, no space before tabs
>>>=20
>>>> +static const struct kernel_param_ops action_ops =3D { .set =3D =
action_set };
>>>> +module_param_cb(action, &action_ops, NULL, S_IRUGO);
>>>=20
>>> =46rom `./scripts/checkpatch.pl --strict`:
>>> WARNING: Symbolic permissions 'S_IRUGO' are not preferred. Consider =
using
>>> octal permissions '0444'.
>>>=20
>>>> +MODULE_PARM_DESC(action, "Action taken when watchdog expires: =
\"hard-poweroff\", \"hard-restart\", or \"dump-restart\" =
(default=3D\"hard-restart\")");
>>>=20
>>> The line exceeds 100 columns.
>> I was under the impression that strings were an exception to the
>> line-length rule. Is that not the case?
> You can use
>=20
> MODULE_PARM_DESC(action,
> 		 "Some text");

The line is still over 100 columns if I do this.

I can shrink the line by removing the valid inputs from the string if =
100 columns
is a hard rule.

If so, where should I document the valid inputs instead?

Is Documentation/watchdog/watchdog-parameters.rst a better place for =
them?


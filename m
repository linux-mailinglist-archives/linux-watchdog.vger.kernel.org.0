Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEC785534C6
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Jun 2022 16:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbiFUOpi (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Jun 2022 10:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233057AbiFUOph (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Jun 2022 10:45:37 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81D211CB1E
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Jun 2022 07:45:37 -0700 (PDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LEge2R014696;
        Tue, 21 Jun 2022 14:45:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=rlGp1ZBr5LIPClzBnWZoPVjow12ra4Wnniyl0HfZFbs=;
 b=KX1TC+jIqWVh7KjIdbJoob6NpoDeY0s9yKr7+GwYA94mDHxY/1RU4CB5QF5VINdqd0Tq
 3U5rCDG7rwycbDGuPHhy/ZKqM1wAioXptSDh/ov/TJHct7Ura5fudZrHCpLWFzCFIECt
 SFlWYTG47tEtC/5/luhJ1IeLjPhbHg0iZXn5PpvbcnwZHU2cwUDLB0rO8a1zeUPqqk8L
 ZEdinM5cbZNSAvoaaAYp59wln+VRpN2oMxMfnV40H0hMIriRAgMcY7oAfZysgJYf+xwG
 JQJp443gwL5Tfer7qHh9DIuhM/hVa2+HSEzXI67zEXXgMrPT9fviWx+RRF2Ph+QLar63 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gug0002ak-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Jun 2022 14:45:18 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25LEi53l031786;
        Tue, 21 Jun 2022 14:45:17 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gug00029q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Jun 2022 14:45:17 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
        by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25LELERf025260;
        Tue, 21 Jun 2022 14:45:16 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
        by ppma05wdc.us.ibm.com with ESMTP id 3gs6b9chyt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Jun 2022 14:45:16 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25LEjF6610289572
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 21 Jun 2022 14:45:15 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 86661AE063;
        Tue, 21 Jun 2022 14:45:15 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3F2CFAE064;
        Tue, 21 Jun 2022 14:45:15 +0000 (GMT)
Received: from localhost (unknown [9.211.80.5])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 21 Jun 2022 14:45:15 +0000 (GMT)
From:   Nathan Lynch <nathanl@linux.ibm.com>
To:     Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org
Cc:     linux@roeck-us.net, tzungbi@kernel.org, brking@linux.ibm.com,
        aik@ozlabs.ru, npiggin@gmail.com, vaishnavi@linux.ibm.com,
        wvoigt@us.ibm.com, linuxppc-dev@lists.ozlabs.org,
        Scott Cheloha <cheloha@linux.ibm.com>
Subject: Re: [PATCH v2 1/4] powerpc/pseries: hvcall.h: add H_WATCHDOG
 opcode, H_NOOP return code
In-Reply-To: <20220602175353.68942-2-cheloha@linux.ibm.com>
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
 <20220602175353.68942-2-cheloha@linux.ibm.com>
Date:   Tue, 21 Jun 2022 09:44:42 -0500
Message-ID: <87a6a6nkit.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: agk8Z1kgyynumTunF44NsQkaUBsXoeQw
X-Proofpoint-GUID: gQfKKbBC3cJbBd4HbZFFpAviflnxmDlh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_07,2022-06-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 mlxlogscore=999 impostorscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206210062
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Scott Cheloha <cheloha@linux.ibm.com> writes:
> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
> guest control of one or more virtual watchdog timers.
>
> Add the opcode for the H_WATCHDOG hypercall to hvcall.h.  While here,
> add a definition for H_NOOP, a possible return code for H_WATCHDOG.
>
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/hvcall.h | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index d92a20a85395..4b4f69c35b4f 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -87,6 +87,7 @@
>  #define H_P7		-60
>  #define H_P8		-61
>  #define H_P9		-62
> +#define H_NOOP		-63
>  #define H_TOO_BIG	-64
>  #define H_UNSUPPORTED	-67
>  #define H_OVERLAP	-68

Not a problem to fix in your series, but I guess these should be
parenthesized i.e.

#define H_P7		(-60)
#define H_P8		(-61)
#define H_P9		(-62)
#define H_NOOP		(-63)

> @@ -324,7 +325,8 @@
>  #define H_RPT_INVALIDATE	0x448
>  #define H_SCM_FLUSH		0x44C
>  #define H_GET_ENERGY_SCALE_INFO	0x450
> -#define MAX_HCALL_OPCODE	H_GET_ENERGY_SCALE_INFO
> +#define H_WATCHDOG		0x45C
> +#define MAX_HCALL_OPCODE	H_WATCHDOG
>

Looks fine.

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>


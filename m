Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14D94571628
	for <lists+linux-watchdog@lfdr.de>; Tue, 12 Jul 2022 11:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbiGLJwN (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 12 Jul 2022 05:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbiGLJwN (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 12 Jul 2022 05:52:13 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D8A3AA774;
        Tue, 12 Jul 2022 02:52:12 -0700 (PDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26C98ZK6010031;
        Tue, 12 Jul 2022 09:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kZLspZUt8Hz9W5xhzmxhpaQgSSao7M34bUWOKxpjPXo=;
 b=lY3N003OC2KbNFO8RwjSCwu/RX8e8mo/s9U57m8N+r4o63/xUveKKVZwWTqrU55NBjUr
 k6W9qexXf1QcL7c8J1F/B5KMaqgvpxM/FufLdG2/DD0ttcWQhEom/6nLLw3Lmddy++xU
 jvI65YBqJdtW4ZLRfdL4JkKClzCmWcmb6v7/1MH2xLZUM5cUFk2lRAIyvH16bbCwQGOp
 TciPoUl+taMjsdEJLvkxwfghrA5kenTPVozQTR5mPrni3P8Kcvw+zvazenoAgMRWa+sy
 ZH3uKjJ9KO44XnvDbDjb4F7H1PJUaDLOi1bkwihfVzmKlRv/278dUtDCohlyYDwYAMEA 5w== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h95bda36m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Jul 2022 09:51:43 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26C9pa2G002504;
        Tue, 12 Jul 2022 09:51:43 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h95bda35v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Jul 2022 09:51:42 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
        by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26C9pf99020690;
        Tue, 12 Jul 2022 09:51:41 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
        by ppma04ams.nl.ibm.com with ESMTP id 3h8rrn0w7w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Jul 2022 09:51:40 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26C9pct720578626
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 12 Jul 2022 09:51:38 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5D4E8AE04D;
        Tue, 12 Jul 2022 09:51:38 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E6652AE051;
        Tue, 12 Jul 2022 09:51:37 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Tue, 12 Jul 2022 09:51:37 +0000 (GMT)
Message-ID: <b92a58db-7fe3-fa88-329e-953ef4b7ebbd@linux.ibm.com>
Date:   Tue, 12 Jul 2022 11:51:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.1
Subject: Re: [PATCH v3 3/4] powerpc/watchdog: introduce a NMI watchdog's
 factor
Content-Language: fr
To:     Nicholas Piggin <npiggin@gmail.com>, benh@kernel.crashing.org,
        haren@linux.vnet.ibm.com, linux@roeck-us.net, mpe@ellerman.id.au,
        nathanl@linux.ibm.com, paulus@samba.org, wim@linux-watchdog.org
Cc:     linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-watchdog@vger.kernel.org
References: <20220627135347.32624-1-ldufour@linux.ibm.com>
 <20220627135347.32624-4-ldufour@linux.ibm.com>
 <1657589870.vvurapsif3.astroid@bobo.none>
From:   Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <1657589870.vvurapsif3.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -lkPNaI8E_CkYDYKshFvVvOgR7F4wLTJ
X-Proofpoint-ORIG-GUID: ELk769d508oEI099WFQHjK4eTVV_l9Lk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_05,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120035
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Le 12/07/2022 à 03:42, Nicholas Piggin a écrit :
> Excerpts from Laurent Dufour's message of June 27, 2022 11:53 pm:
>> Introduce a factor which would apply to the NMI watchdog timeout.
>>
>> This factor is a percentage added to the watchdog_tresh value. The value is
>> set under the watchdog_mutex protection and lockup_detector_reconfigure()
>> is called to recompute wd_panic_timeout_tb.
>>
>> Once the factor is set, it remains until it is set back to 0, which means
>> no impact.
> 
> Looks okay. We could worry about making it more generic or nicer if
> another user came along.
> 
> Could you make the naming a bit more self documenting? 
> watchdog_nmi_set_timeout_pct(), maybe? Does the wd really care
> that it is for LPM in particular?

You're right, the name should not mention lpm.
For my information, what does "pct" stand for?

> 
> Variables and parameters could have a _pct suffix too.

I'll do that.

> 
> Otherwise
> 
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> 
>>
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>> ---
>>  arch/powerpc/include/asm/nmi.h |  2 ++
>>  arch/powerpc/kernel/watchdog.c | 21 ++++++++++++++++++++-
>>  2 files changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/nmi.h b/arch/powerpc/include/asm/nmi.h
>> index ea0e487f87b1..7d6a8d9b0543 100644
>> --- a/arch/powerpc/include/asm/nmi.h
>> +++ b/arch/powerpc/include/asm/nmi.h
>> @@ -5,8 +5,10 @@
>>  #ifdef CONFIG_PPC_WATCHDOG
>>  extern void arch_touch_nmi_watchdog(void);
>>  long soft_nmi_interrupt(struct pt_regs *regs);
>> +void watchdog_nmi_set_lpm_factor(u64 factor);
>>  #else
>>  static inline void arch_touch_nmi_watchdog(void) {}
>> +static inline void watchdog_nmi_set_lpm_factor(u64 factor) {}
>>  #endif
>>  
>>  #ifdef CONFIG_NMI_IPI
>> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
>> index 7d28b9553654..80851b228f71 100644
>> --- a/arch/powerpc/kernel/watchdog.c
>> +++ b/arch/powerpc/kernel/watchdog.c
>> @@ -91,6 +91,10 @@ static cpumask_t wd_smp_cpus_pending;
>>  static cpumask_t wd_smp_cpus_stuck;
>>  static u64 wd_smp_last_reset_tb;
>>  
>> +#ifdef CONFIG_PPC_PSERIES
>> +static u64 wd_factor;
>> +#endif
>> +
>>  /*
>>   * Try to take the exclusive watchdog action / NMI IPI / printing lock.
>>   * wd_smp_lock must be held. If this fails, we should return and wait
>> @@ -527,7 +531,13 @@ static int stop_watchdog_on_cpu(unsigned int cpu)
>>  
>>  static void watchdog_calc_timeouts(void)
>>  {
>> -	wd_panic_timeout_tb = watchdog_thresh * ppc_tb_freq;
>> +	u64 threshold = watchdog_thresh;
>> +
>> +#ifdef CONFIG_PPC_PSERIES
>> +	threshold += (READ_ONCE(wd_factor) * threshold) / 100;
>> +#endif
>> +
>> +	wd_panic_timeout_tb = threshold * ppc_tb_freq;
>>  
>>  	/* Have the SMP detector trigger a bit later */
>>  	wd_smp_panic_timeout_tb = wd_panic_timeout_tb * 3 / 2;
>> @@ -570,3 +580,12 @@ int __init watchdog_nmi_probe(void)
>>  	}
>>  	return 0;
>>  }
>> +
>> +#ifdef CONFIG_PPC_PSERIES
>> +void watchdog_nmi_set_lpm_factor(u64 factor)
>> +{
>> +	pr_info("Set the NMI watchdog factor to %llu%%\n", factor);
>> +	WRITE_ONCE(wd_factor, factor);
>> +	lockup_detector_reconfigure();
>> +}
>> +#endif
>> -- 
>> 2.36.1
>>
>>


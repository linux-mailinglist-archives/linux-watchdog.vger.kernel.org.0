Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C27E553526
	for <lists+linux-watchdog@lfdr.de>; Tue, 21 Jun 2022 17:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241043AbiFUPDp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Jun 2022 11:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352154AbiFUPDp (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Jun 2022 11:03:45 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 241D413E23
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Jun 2022 08:03:44 -0700 (PDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LEnxIP035992;
        Tue, 21 Jun 2022 15:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=65fMU9n67FJlwFHGvKVLEcNniLMTH8ymHIw2cwWSPTQ=;
 b=FUciNkU8txtAldDnRNOocWfKYe/7BqN0Ove6s7qMxRiCYCxnpDE4AuWHEX+uBNliYI85
 Mqng1db7hOYAuHyCfP6CyG0DXwutTwKbE5J49cFvFT0W4Mt+sCG9AgXGreXJ1IjiX3gd
 FxXH0CkHytDK24M4WFsykNmLsh6lhjV3oq4llcU82sw/CKq6bK+Q3KAh8RjOVyKMZA84
 9U4xAkHyQ9RRW3L8aaREkBbO6z4h34GL7xztLzimFyWAum7tiPl9E5WsGHnUvZBtI7fB
 TFGaMHS7xbTriLhe4dqDVyyVMTJn4S3OzQWmJ0WqdHgFRPwRB266rSE9ZZSlmSU5YQZ+ yA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gug3mgcwy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Jun 2022 15:03:11 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25LEsl2h018823;
        Tue, 21 Jun 2022 15:03:11 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gug3mgcwk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Jun 2022 15:03:11 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25LEq2tb015394;
        Tue, 21 Jun 2022 15:03:10 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com [9.57.198.26])
        by ppma01wdc.us.ibm.com with ESMTP id 3gs6b9cn41-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Jun 2022 15:03:10 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
        by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25LF39k18716822
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 21 Jun 2022 15:03:09 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B476C112062;
        Tue, 21 Jun 2022 15:03:09 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6664C112064;
        Tue, 21 Jun 2022 15:03:09 +0000 (GMT)
Received: from localhost (unknown [9.211.80.5])
        by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 21 Jun 2022 15:03:09 +0000 (GMT)
From:   Nathan Lynch <nathanl@linux.ibm.com>
To:     Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org
Cc:     linux@roeck-us.net, tzungbi@kernel.org, brking@linux.ibm.com,
        aik@ozlabs.ru, npiggin@gmail.com, vaishnavi@linux.ibm.com,
        wvoigt@us.ibm.com, linuxppc-dev@lists.ozlabs.org,
        Scott Cheloha <cheloha@linux.ibm.com>
Subject: Re: [PATCH v2 2/4] powerpc/pseries: add FW_FEATURE_WATCHDOG flag
In-Reply-To: <20220602175353.68942-3-cheloha@linux.ibm.com>
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
 <20220602175353.68942-3-cheloha@linux.ibm.com>
Date:   Tue, 21 Jun 2022 10:03:08 -0500
Message-ID: <877d5anjo3.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _Gy8H3F-MhxMSkWzr3xpZX3w7RuUjPvV
X-Proofpoint-GUID: nrMHRX9aQteBjaS09Bw-jc7YesFSUZUg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_07,2022-06-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210063
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Scott Cheloha <cheloha@linux.ibm.com> writes:
> PAPR v2.12 specifies a new optional function set, "hcall-watchdog",
> for the /rtas/ibm,hypertas-functions property.  The presence of this
> function set indicates support for the H_WATCHDOG hypercall.
>
> Check for this function set and, if present, set the new
> FW_FEATURE_WATCHDOG flag.
>
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>

...

> diff --git a/arch/powerpc/include/asm/firmware.h b/arch/powerpc/include/asm/firmware.h
> index 8dddd34b8ecf..398e0b5e485f 100644
> --- a/arch/powerpc/include/asm/firmware.h
> +++ b/arch/powerpc/include/asm/firmware.h
> @@ -55,6 +55,7 @@
>  #define FW_FEATURE_RPT_INVALIDATE ASM_CONST(0x0000010000000000)
>  #define FW_FEATURE_FORM2_AFFINITY ASM_CONST(0x0000020000000000)
>  #define FW_FEATURE_ENERGY_SCALE_INFO ASM_CONST(0x0000040000000000)
> +#define FW_FEATURE_WATCHDOG	ASM_CONST(0x0000080000000000)
>  
>  #ifndef __ASSEMBLY__
>  
> @@ -76,7 +77,7 @@ enum {
>  		FW_FEATURE_DRC_INFO | FW_FEATURE_BLOCK_REMOVE |
>  		FW_FEATURE_PAPR_SCM | FW_FEATURE_ULTRAVISOR |
>  		FW_FEATURE_RPT_INVALIDATE | FW_FEATURE_FORM2_AFFINITY |
> -		FW_FEATURE_ENERGY_SCALE_INFO,
> +		FW_FEATURE_ENERGY_SCALE_INFO | FW_FEATURE_WATCHDOG,
>  	FW_FEATURE_PSERIES_ALWAYS = 0,
>  	FW_FEATURE_POWERNV_POSSIBLE = FW_FEATURE_OPAL | FW_FEATURE_ULTRAVISOR,
>  	FW_FEATURE_POWERNV_ALWAYS = 0,
> diff --git a/arch/powerpc/platforms/pseries/firmware.c b/arch/powerpc/platforms/pseries/firmware.c
> index 09c119b2f623..080108d129ed 100644
> --- a/arch/powerpc/platforms/pseries/firmware.c
> +++ b/arch/powerpc/platforms/pseries/firmware.c
> @@ -67,6 +67,7 @@ hypertas_fw_features_table[] = {
>  	{FW_FEATURE_PAPR_SCM,		"hcall-scm"},
>  	{FW_FEATURE_RPT_INVALIDATE,	"hcall-rpt-invalidate"},
>  	{FW_FEATURE_ENERGY_SCALE_INFO,	"hcall-energy-scale-info"},
> +	{FW_FEATURE_WATCHDOG,		"hcall-watchdog"},
>  };

All looks correct.

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>

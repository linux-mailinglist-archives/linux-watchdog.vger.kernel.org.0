Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1FBC56A747
	for <lists+linux-watchdog@lfdr.de>; Thu,  7 Jul 2022 17:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbiGGPyM (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 7 Jul 2022 11:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbiGGPyM (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 7 Jul 2022 11:54:12 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6182313F19
        for <linux-watchdog@vger.kernel.org>; Thu,  7 Jul 2022 08:54:11 -0700 (PDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 267Fk42M017782;
        Thu, 7 Jul 2022 15:53:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=HsXhzMbsl58YXp9Hf56vlQISL9eW3bx0Z7mQpkenJ4k=;
 b=h4aBVIbHi+MwSmpecgkYhXEdv84JnVXP1AYQ7PYOLFPb4txwY2+hvOAFOVx5/hOMVHO4
 T7heGyc1eol+B99s3CK1R+3XtJ/s4+veOREvkcfD3Z4qdgNpumA+FUVNYiBGjLZLaHRp
 SZGM7/2/yUvfTRwrnxkLSSXhv7v7Tw4MpDDo1UVoK9eIWi0WxVTOxYw1tTKvsbeokrsB
 PmZcTApgUbx3LmLnJwy/IT7xcf5K6Igv4r/SSmIWjtfR4mkFkydFZ82RLq+RyATzBBoB
 1w2fJgTi0YzHMXjJMbQ4p+J3wdfbJ21RXH2k4UkSDrmZ0TsZ/fyMD2tcShrr7hI5nZ8S iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h62dx85xf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Jul 2022 15:53:51 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 267Fkwpm019523;
        Thu, 7 Jul 2022 15:53:50 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h62dx85x3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Jul 2022 15:53:50 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 267Fpnei020455;
        Thu, 7 Jul 2022 15:53:49 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
        by ppma01dal.us.ibm.com with ESMTP id 3h4ud7qbkj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 07 Jul 2022 15:53:49 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
        by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 267Frmkn21430552
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 7 Jul 2022 15:53:48 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 944C528060;
        Thu,  7 Jul 2022 15:53:48 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7197E2805C;
        Thu,  7 Jul 2022 15:53:48 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
        by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu,  7 Jul 2022 15:53:48 +0000 (GMT)
Date:   Thu, 7 Jul 2022 10:53:48 -0500
From:   Scott Cheloha <cheloha@linux.ibm.com>
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Nathan Lynch <nathanl@linux.ibm.com>,
        linux-watchdog@vger.kernel.org, wvoigt@us.ibm.com, aik@ozlabs.ru,
        vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org,
        brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux@roeck-us.net
Subject: Re: [PATCH v2 3/4] powerpc/pseries: register pseries-wdt device with
 platform bus
Message-ID: <YscBjN2DCjTbq4Dk@rascal-austin-ibm-com>
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
 <20220602175353.68942-4-cheloha@linux.ibm.com>
 <874k0enied.fsf@linux.ibm.com>
 <87v8sq42ev.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8sq42ev.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aCPfHfI9MZtSeFsVTbj139i8gUPvG_vF
X-Proofpoint-ORIG-GUID: sTnJ6KQ8fKS9wsz78_SZ58hFqZEMMYJh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-07_12,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207070061
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, Jun 24, 2022 at 11:27:36PM +1000, Michael Ellerman wrote:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
> > Scott Cheloha <cheloha@linux.ibm.com> writes:
> >> PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
> >> guest control of one or more virtual watchdog timers.
> ...
> >
> > Seems like we don't need pseries_wdt_pdev as it's unused elsewhere? But
> > that's quite minor.
> 
> It's minor but please drop it in the next version.

Dropped.

Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63FB0553E6F
	for <lists+linux-watchdog@lfdr.de>; Wed, 22 Jun 2022 00:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231466AbiFUWX1 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 21 Jun 2022 18:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240598AbiFUWXQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 21 Jun 2022 18:23:16 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FDD031218
        for <linux-watchdog@vger.kernel.org>; Tue, 21 Jun 2022 15:23:15 -0700 (PDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LMDpZx018863;
        Tue, 21 Jun 2022 22:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=HUHZczTGFIbiJuVzGt6GJeRFfp2WIYIpzg71Qya8H1E=;
 b=dq4x9a76XV0qAEQzLi0c/QscEOJ1jTNOfKfNsjJrpawlOrU+amoT9J9Buyjy0QJAzivR
 RqHzu8wH1gBIp0JpJJ7P9P9EsYPIpKkTYgwUvZxCHxjc1gFyqV7xQ+dxD+Q/4GOxXyg5
 fxoiiG975TZsd2WHnGZMnyi+JAdO2paPxiNt72pwMctIwg+EcRCDaSwwvy7NKCmJpXIF
 ep6NowYuyxEIgf8M5wZuNiqEvqORs/Twqqm98Iki51WjvANF+YjehSoSWagJ8ESw8dRx
 WqfrVrHUNemwy+HHCy9FHOHZazV9bKNm0YfA8k7z98H1Dh85cD1oEveXGygXUJrd0P7E ZA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gupkjg5h8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Jun 2022 22:22:54 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25LMLMCu009774;
        Tue, 21 Jun 2022 22:22:53 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gupkjg5h1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Jun 2022 22:22:53 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25LMMqlR003994;
        Tue, 21 Jun 2022 22:22:53 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
        by ppma03wdc.us.ibm.com with ESMTP id 3gs6baerkf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Jun 2022 22:22:53 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25LMMEwI26280242
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 21 Jun 2022 22:22:14 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 76104BE04F;
        Tue, 21 Jun 2022 22:22:14 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 560E6BE051;
        Tue, 21 Jun 2022 22:22:14 +0000 (GMT)
Received: from localhost (unknown [9.211.80.5])
        by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
        Tue, 21 Jun 2022 22:22:14 +0000 (GMT)
From:   Nathan Lynch <nathanl@linux.ibm.com>
To:     Segher Boessenkool <segher@kernel.crashing.org>
Cc:     Scott Cheloha <cheloha@linux.ibm.com>,
        linux-watchdog@vger.kernel.org, wvoigt@us.ibm.com, aik@ozlabs.ru,
        vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org,
        brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux@roeck-us.net
Subject: Re: [PATCH v2 1/4] powerpc/pseries: hvcall.h: add H_WATCHDOG
 opcode, H_NOOP return code
In-Reply-To: <20220621173155.GQ25951@gate.crashing.org>
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
 <20220602175353.68942-2-cheloha@linux.ibm.com>
 <87a6a6nkit.fsf@linux.ibm.com> <20220621173155.GQ25951@gate.crashing.org>
Date:   Tue, 21 Jun 2022 17:22:14 -0500
Message-ID: <87v8stmzc9.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -GScGKhpqM_lq2-GoKJ3HY-HMuYKYdzu
X-Proofpoint-GUID: 7SCPGeDNieLlWxS8ST8Ip19mK108RyaP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_09,2022-06-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=911 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1011 bulkscore=0 spamscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206210094
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Segher Boessenkool <segher@kernel.crashing.org> writes:

> Hi!
>
> On Tue, Jun 21, 2022 at 09:44:42AM -0500, Nathan Lynch wrote:
>> Not a problem to fix in your series, but I guess these should be
>> parenthesized i.e.
>> 
>> #define H_P7		(-60)
>> #define H_P8		(-61)
>> #define H_P9		(-62)
>> #define H_NOOP		(-63)
>
> Why?  It does not change the semantics of any correct code.  For what
> incorrect code will it make the diagnostics clearer?

Yeah never mind, I was confused.

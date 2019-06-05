Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45A0A36780
	for <lists+linux-watchdog@lfdr.de>; Thu,  6 Jun 2019 00:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbfFEWbZ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 5 Jun 2019 18:31:25 -0400
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:37830 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726502AbfFEWbZ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 5 Jun 2019 18:31:25 -0400
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
        by mx0a-002e3701.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x55MPvsO026302;
        Wed, 5 Jun 2019 22:31:05 GMT
Received: from g4t3425.houston.hpe.com (g4t3425.houston.hpe.com [15.241.140.78])
        by mx0a-002e3701.pphosted.com with ESMTP id 2sxkhks4xy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 05 Jun 2019 22:31:04 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net [16.220.97.129])
        by g4t3425.houston.hpe.com (Postfix) with ESMTP id 21264BA;
        Wed,  5 Jun 2019 22:31:03 +0000 (UTC)
Received: from anatevka (anatevka.americas.hpqcorp.net [10.34.81.61])
        by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id 41A0F4F;
        Wed,  5 Jun 2019 22:31:03 +0000 (UTC)
Date:   Wed, 5 Jun 2019 16:31:03 -0600
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     linux@roeck-us.net, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] watchdog/hpwdt: cleanups and kdump accommodations
Message-ID: <20190605223102.GA23382@anatevka>
Reply-To: Jerry.Hoemann@hpe.com
References: <1558126783-4877-1-git-send-email-jerry.hoemann@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558126783-4877-1-git-send-email-jerry.hoemann@hpe.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-05_14:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=984 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906050143
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Fri, May 17, 2019 at 02:59:37PM -0600, Jerry Hoemann wrote:
> First two changes makes hpwdt more generic.
> Next two changes make hpwdt work better with kdump.
> 

Hi Guenter,

Did you have feedback on this patch set?

Thanks

Jerry


> 
> Jerry Hoemann (6):
>   watchdog/hpwdt: Stop hpwdt on unregister.
>   watchdog/hpwdt: Advertize max_hw_heartbeat_ms
>   watchdog/hpwdt: Have core ping watchdog.
>   watchdog/hpwdt: Add module parameter kdumptimeout.
>   watchdog/hpwdt: Update documentation
>   watchdog/hpwdt: Reflect changes
> 
>  Documentation/watchdog/hpwdt.txt |  4 +++
>  drivers/watchdog/hpwdt.c         | 55 ++++++++++++++++++++++++++++++----------
>  2 files changed, 45 insertions(+), 14 deletions(-)
> 
> -- 
> 1.8.3.1

-- 

-----------------------------------------------------------------------------
Jerry Hoemann                  Software Engineer   Hewlett Packard Enterprise
-----------------------------------------------------------------------------

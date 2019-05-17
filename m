Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8074B21F40
	for <lists+linux-watchdog@lfdr.de>; Fri, 17 May 2019 23:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729313AbfEQVCa (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 17 May 2019 17:02:30 -0400
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:36052 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728382AbfEQVCa (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 17 May 2019 17:02:30 -0400
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x4HL18oL004720;
        Fri, 17 May 2019 21:02:07 GMT
Received: from g2t2352.austin.hpe.com (g2t2352.austin.hpe.com [15.233.44.25])
        by mx0b-002e3701.pphosted.com with ESMTP id 2sj2yngk0p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 May 2019 21:02:07 +0000
Received: from g2t2360.austin.hpecorp.net (g2t2360.austin.hpecorp.net [16.196.225.135])
        by g2t2352.austin.hpe.com (Postfix) with ESMTP id 63D9CA3;
        Fri, 17 May 2019 21:02:06 +0000 (UTC)
Received: from lxbuild.ftc.rdlabs.hpecorp.net (lxbuild.ftc.rdlabs.hpecorp.net [16.78.34.175])
        by g2t2360.austin.hpecorp.net (Postfix) with ESMTP id 4189944;
        Fri, 17 May 2019 21:02:05 +0000 (UTC)
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     linux@roeck-us.net, wim@linux-watchdog.org,
        linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, mironov.ivan@gmail.com,
        rasmus.villemoes@prevas.dk, jerry.hoemann@hpe.com
Subject: [PATCH 0/6] watchdog/hpwdt: cleanups and kdump accommodations
Date:   Fri, 17 May 2019 14:59:37 -0600
Message-Id: <1558126783-4877-1-git-send-email-jerry.hoemann@hpe.com>
X-Mailer: git-send-email 1.8.3.1
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-05-17_13:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=619 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905170125
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

First two changes makes hpwdt more generic.
Next two changes make hpwdt work better with kdump.


Jerry Hoemann (6):
  watchdog/hpwdt: Stop hpwdt on unregister.
  watchdog/hpwdt: Advertize max_hw_heartbeat_ms
  watchdog/hpwdt: Have core ping watchdog.
  watchdog/hpwdt: Add module parameter kdumptimeout.
  watchdog/hpwdt: Update documentation
  watchdog/hpwdt: Reflect changes

 Documentation/watchdog/hpwdt.txt |  4 +++
 drivers/watchdog/hpwdt.c         | 55 ++++++++++++++++++++++++++++++----------
 2 files changed, 45 insertions(+), 14 deletions(-)

-- 
1.8.3.1


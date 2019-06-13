Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1B6C4478D
	for <lists+linux-watchdog@lfdr.de>; Thu, 13 Jun 2019 19:00:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393198AbfFMRAR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 13 Jun 2019 13:00:17 -0400
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:40078 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729775AbfFMAEO (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 12 Jun 2019 20:04:14 -0400
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
        by mx0a-002e3701.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x5D02DT1001797;
        Thu, 13 Jun 2019 00:03:52 GMT
Received: from g4t3426.houston.hpe.com (g4t3426.houston.hpe.com [15.241.140.75])
        by mx0a-002e3701.pphosted.com with ESMTP id 2t39f3u30y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Jun 2019 00:03:52 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net [16.220.97.129])
        by g4t3426.houston.hpe.com (Postfix) with ESMTP id A325254;
        Thu, 13 Jun 2019 00:03:51 +0000 (UTC)
Received: from anatevka.ftc.rdlabs.hpecorp.net (anatevka.americas.hpqcorp.net [10.34.81.61])
        by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id E646656;
        Thu, 13 Jun 2019 00:03:50 +0000 (UTC)
From:   Jerry Hoemann <jerry.hoemann@hpe.com>
To:     linux@roeck-us.net
Cc:     wim@linux-watchdog.org, mchehab+samsung@kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jerry Hoemann <jerry.hoemann@hpe.com>
Subject: [PATCH 0/1] docs: watchdog: make htmldocs failed.
Date:   Wed, 12 Jun 2019 18:02:36 -0600
Message-Id: <20190613000237.377-1-jerry.hoemann@hpe.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-06-12_14:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=4 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=775 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906120169
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Guenter,

While making htmldocs from linux-staging.git watchdog-next, the
build failed due what I think is a missing blank line after a header
separator in:

	Documentation/watchdog/watchdog-parameters.rst

I'm a newbie w.r.t. to the .rst file formats, but adding the blank
lines got the "make htmldocs" to complete.






Jerry Hoemann (1):
  docs: watchdog: Fix build error.

 Documentation/watchdog/watchdog-parameters.rst | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.20.1


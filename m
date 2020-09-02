Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B7825ABA9
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Sep 2020 15:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726724AbgIBNEL (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Sep 2020 09:04:11 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:40588 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727859AbgIBNDm (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Sep 2020 09:03:42 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id 0F011574E9;
        Wed,  2 Sep 2020 13:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-transfer-encoding:mime-version:user-agent:content-type
        :content-type:organization:date:date:from:from:subject:subject
        :message-id:received:received:received; s=mta-01; t=1599051709;
         x=1600866110; bh=dxrkS/aX5yeChGiqu1IMF0Fne/EsfHUnIkOcp1B4TN8=; b=
        hIB8qVeU9aSDbCq8oo0SIymw3RagNFW6M8y0CevJWdj6qJHNFbfjvYoItoHAPotU
        jwQvYfbRuBxCR6gk2jAaTvdkXK9vSFRsCE1qV2pdvieXQKYXdU9jqtRbWac8E0TI
        hmghWAjnIL2ldcv2/HAn45mNx2kaAzFCh4qVSkg13cg=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 9t_TD-qV_gA5; Wed,  2 Sep 2020 16:01:49 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id 65A6B574FE;
        Wed,  2 Sep 2020 15:59:33 +0300 (MSK)
Received: from localhost.localdomain (10.199.3.6) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 2 Sep
 2020 15:59:32 +0300
Message-ID: <d2343032814705f33cd81f18f45630bf327c0ff8.camel@yadro.com>
Subject: watchdog start on restart
From:   Ivan Mikhaylov <i.mikhaylov@yadro.com>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Ivan Mikhaylov <i.mikhaylov@yadro.com>
Date:   Wed, 2 Sep 2020 16:02:53 +0300
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.3.6]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hello everyone. Currently, the watchdog interface only has "stop watchdog on
restart" but lacks a "start watchdog on restart" one. Is there a way to achieve
such functionality?

I'd like to know why "stop watchdog on restart" wasn't implemented via ioctl
interface? It would be more convenient from user perspective and you can
control that behavior whenever you want from application layer.

I have some thoughts on this problem that solve the aforementioned
issue with "start watchdog on restart" but I don't think that my solution is
correct.

Looking forward for your feedback.

Thanks.


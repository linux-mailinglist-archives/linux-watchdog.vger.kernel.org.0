Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6132A25BEEC
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Sep 2020 12:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgICKQK (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 3 Sep 2020 06:16:10 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:56630 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726162AbgICKQJ (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 3 Sep 2020 06:16:09 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id 8FB6C542D3;
        Thu,  3 Sep 2020 10:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-transfer-encoding:mime-version:user-agent:content-type
        :content-type:organization:references:in-reply-to:date:date:from
        :from:subject:subject:message-id:received:received:received; s=
        mta-01; t=1599128166; x=1600942567; bh=hG/MCAQyYQhX01WN0uxqTRhm0
        5X7D7VyvjKq75g9WDY=; b=bbycdTpBLRJu2pBDE9tj07vJLkIu/5VPMjpUdbpK6
        BJOg11EHh9Tr2TBwfXc0eCRJR9H6IVPys8U/tE6hwQxAOgzO1cU8YpMF1vXq4LPb
        edqCyE2gFqfE1BiV6Yz9Es/gTmEbi6JCI6FGDNS6wbxcSZJ923vuAV3KCmxAN07b
        cI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id aH_ZQYl4KLGb; Thu,  3 Sep 2020 13:16:06 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id C8DB350242;
        Thu,  3 Sep 2020 13:16:05 +0300 (MSK)
Received: from localhost.localdomain (10.199.2.130) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 3 Sep 2020 13:16:05 +0300
Message-ID: <6dd97c08809d576136d474f4b3f3b045a03634bb.camel@yadro.com>
Subject: Re: watchdog start on restart
From:   Ivan Mikhaylov <i.mikhaylov@yadro.com>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date:   Thu, 3 Sep 2020 13:19:28 +0300
In-Reply-To: <e04bc12d-4520-89db-699c-ad89fcdbf76e@csgroup.eu>
References: <d2343032814705f33cd81f18f45630bf327c0ff8.camel@yadro.com>
         <e04bc12d-4520-89db-699c-ad89fcdbf76e@csgroup.eu>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.199.2.130]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, 2020-09-02 at 15:19 +0200, Christophe Leroy wrote:
 
> Isn't it the default expected behaviour for a watchdog ?

It depends on hardware and system requirements. You may have not just one
watchdog device.

> "stop watchdog on restart" is there to keep things under control during 
> a wanted machine reboot/restart, while still having the watchdog do its 
> job on an unexpected restart.

Yes, that's correct.

> What would be the advantage of an ioctl() compared to the existing way ?

You can control stop/start at any moment for any number of watchdog devices.

Thanks.


Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1F325C228
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Sep 2020 16:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728603AbgICOGE (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 3 Sep 2020 10:06:04 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:46254 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728646AbgICOFq (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 3 Sep 2020 10:05:46 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id EEB8E52195;
        Thu,  3 Sep 2020 13:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-transfer-encoding:mime-version:user-agent:content-type
        :content-type:organization:references:in-reply-to:date:date:from
        :from:subject:subject:message-id:received:received:received; s=
        mta-01; t=1599139370; x=1600953771; bh=maYMfRPvJLxeRFZ0FdSIdjuGM
        4Bq3KUCafttH82y2bE=; b=QJK0LQ9v4Ikk9Epnuzf4HAoEjyr7yY5rGvshmE63J
        X/hzFwVZy3h57HSJ0jEMzNFfghfXldG5qo9zm8Kahd/vPS7i7DabhfMZOIpr+Lm5
        TJr5gEOWpvSdIRFMscOV9p8G/wYFU2kNaH45ez42TAKwlnfYb5nKHPeDR6h8J8Ri
        L8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OWFpNQ-Y-vQ3; Thu,  3 Sep 2020 16:22:50 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id DA97E5141E;
        Thu,  3 Sep 2020 16:22:50 +0300 (MSK)
Received: from localhost.localdomain (10.199.2.130) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 3 Sep 2020 16:22:50 +0300
Message-ID: <7a58bc3f80783170ecc38371aad7addc04397787.camel@yadro.com>
Subject: Re: watchdog start on restart
From:   Ivan Mikhaylov <i.mikhaylov@yadro.com>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Guenter Roeck <linux@roeck-us.net>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date:   Thu, 3 Sep 2020 16:26:18 +0300
In-Reply-To: <d6aa46c5-a1ac-c32e-5cc6-bf9a15a53b65@csgroup.eu>
References: <d2343032814705f33cd81f18f45630bf327c0ff8.camel@yadro.com>
         <1721f170-95df-2451-e3af-6369e830afad@roeck-us.net>
         <2b14920abf9f430731ec11c1df6c0253185c7ce7.camel@yadro.com>
         <d6aa46c5-a1ac-c32e-5cc6-bf9a15a53b65@csgroup.eu>
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

On Thu, 2020-09-03 at 13:13 +0200, Christophe Leroy wrote:

> You want to start the watchdog just before calling 'reboot' but want to 
> make sure that the watchdog will not reset the board before all 
> userspace has shut down correctly ?

Yes, just for an example, in the nature exists some aspeed2400/2500 board which
has 2 watchdog devices and 2 spi flash memories. By default it starts from 1 spi
flash. When watchdog triggers, on next boot, it's automatically starts from 2
flash, also you can manually switch from 1 spi flash to 2 with 2 watchdog device
by trigger of it, like transparent reload from 1 spi flash side to 2.

> But what is the purpose of the watchdog then, isn't it there to make 
> sure that the machine gets reboot within a given timeout anyway in case 
> some userspace takes too long to shut down ?

Usually, yes.

Thanks.


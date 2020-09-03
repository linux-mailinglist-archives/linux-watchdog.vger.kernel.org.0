Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9365C25BEF6
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Sep 2020 12:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726268AbgICKTp (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 3 Sep 2020 06:19:45 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:56878 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726109AbgICKTp (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 3 Sep 2020 06:19:45 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id D1869542D3;
        Thu,  3 Sep 2020 10:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-transfer-encoding:mime-version:user-agent:content-type
        :content-type:organization:references:in-reply-to:date:date:from
        :from:subject:subject:message-id:received:received:received; s=
        mta-01; t=1599128381; x=1600942782; bh=3kdp/2jYfEvoYoAnfZ5egG/mA
        0oy4YxmasQnagmOfwY=; b=JXoZxY5LnkQ8sRYeD9ge+xa+zCPTnCRsG7GfJ2z7Y
        OMk8xuuuSwQxxqJRHcYp0mSueZP5qcUsFVjvQOoRyGZJZiH7aiKXb4jt86RZ7yhY
        +eMhQiHROBWp81SmNqjE3rlxj1RRxAJVEpvTgBIQPu0xMFf2QmAtb33UyORqWU8c
        Bk=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 1T_3FNt0-Y1M; Thu,  3 Sep 2020 13:19:41 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id B7BCC50242;
        Thu,  3 Sep 2020 13:19:41 +0300 (MSK)
Received: from localhost.localdomain (10.199.2.130) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 3 Sep 2020 13:19:41 +0300
Message-ID: <2b14920abf9f430731ec11c1df6c0253185c7ce7.camel@yadro.com>
Subject: Re: watchdog start on restart
From:   Ivan Mikhaylov <i.mikhaylov@yadro.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Date:   Thu, 3 Sep 2020 13:23:09 +0300
In-Reply-To: <1721f170-95df-2451-e3af-6369e830afad@roeck-us.net>
References: <d2343032814705f33cd81f18f45630bf327c0ff8.camel@yadro.com>
         <1721f170-95df-2451-e3af-6369e830afad@roeck-us.net>
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

On Wed, 2020-09-02 at 06:36 -0700, Guenter Roeck wrote:
> On 9/2/20 6:02 AM, Ivan Mikhaylov wrote:
> > Hello everyone. Currently, the watchdog interface only has "stop watchdog on
> > restart" but lacks a "start watchdog on restart" one. Is there a way to
> > achieve
> > such functionality?
> > 
> > I'd like to know why "stop watchdog on restart" wasn't implemented via ioctl
> > interface? It would be more convenient from user perspective and you can
> > control that behavior whenever you want from application layer.
> > 
> 
> Because it is and always was a driver level decision. The function was added
> to replace lots of driver level code implementing this functionality.
> Overriding it from userspace doesn't make sense because the driver is supposed
> to have a reason for disabling it on reboot (for example due to clock issues
> or power issues or becasue it has a short hardware timeout).

If it's only driver level decision then it makes sense.

> That functionality doesn't make much sense. It can be accomplished by not
> stopping the watchdog on reboot in the first place. And if the watchdog
> wasn't running before, it can be started from userspace just before the
> reboot.

I understand that it can be started from userspace. As example, I want the
watchdog trigger with guarantee that the userspace will be properly shut on
reboot, how can I get it with current interface? Just start before the reboot
doesn't guarantee that it will be triggered or will be triggered in middle
of reboot/restart.

Thanks.


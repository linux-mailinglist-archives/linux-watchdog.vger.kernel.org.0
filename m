Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 484FF25BFFF
	for <lists+linux-watchdog@lfdr.de>; Thu,  3 Sep 2020 13:17:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728036AbgICLQY (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 3 Sep 2020 07:16:24 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:6185 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727799AbgICLPl (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 3 Sep 2020 07:15:41 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4Bhys33byhz9vCyR;
        Thu,  3 Sep 2020 13:15:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id IsxfKL8rKCpI; Thu,  3 Sep 2020 13:15:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4Bhys32SNgz9vCyN;
        Thu,  3 Sep 2020 13:15:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 9FD558B7FA;
        Thu,  3 Sep 2020 13:15:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id 6OaqXtM4BBp5; Thu,  3 Sep 2020 13:15:20 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 494FF8B7B1;
        Thu,  3 Sep 2020 13:15:20 +0200 (CEST)
Subject: Re: watchdog start on restart
To:     Ivan Mikhaylov <i.mikhaylov@yadro.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <d2343032814705f33cd81f18f45630bf327c0ff8.camel@yadro.com>
 <1721f170-95df-2451-e3af-6369e830afad@roeck-us.net>
 <2b14920abf9f430731ec11c1df6c0253185c7ce7.camel@yadro.com>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d6aa46c5-a1ac-c32e-5cc6-bf9a15a53b65@csgroup.eu>
Date:   Thu, 3 Sep 2020 13:13:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2b14920abf9f430731ec11c1df6c0253185c7ce7.camel@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



Le 03/09/2020 à 12:23, Ivan Mikhaylov a écrit :
> On Wed, 2020-09-02 at 06:36 -0700, Guenter Roeck wrote:
>> On 9/2/20 6:02 AM, Ivan Mikhaylov wrote:
>>> Hello everyone. Currently, the watchdog interface only has "stop watchdog on
>>> restart" but lacks a "start watchdog on restart" one. Is there a way to
>>> achieve
>>> such functionality?
>>>
>>> I'd like to know why "stop watchdog on restart" wasn't implemented via ioctl
>>> interface? It would be more convenient from user perspective and you can
>>> control that behavior whenever you want from application layer.
>>>
>>
>> Because it is and always was a driver level decision. The function was added
>> to replace lots of driver level code implementing this functionality.
>> Overriding it from userspace doesn't make sense because the driver is supposed
>> to have a reason for disabling it on reboot (for example due to clock issues
>> or power issues or becasue it has a short hardware timeout).
> 
> If it's only driver level decision then it makes sense.
> 
>> That functionality doesn't make much sense. It can be accomplished by not
>> stopping the watchdog on reboot in the first place. And if the watchdog
>> wasn't running before, it can be started from userspace just before the
>> reboot.
> 
> I understand that it can be started from userspace. As example, I want the
> watchdog trigger with guarantee that the userspace will be properly shut on
> reboot, how can I get it with current interface? Just start before the reboot
> doesn't guarantee that it will be triggered or will be triggered in middle
> of reboot/restart.
> 

I'm not sure I understand what you want to do.

You want to start the watchdog just before calling 'reboot' but want to 
make sure that the watchdog will not reset the board before all 
userspace has shut down correctly ?

But what is the purpose of the watchdog then, isn't it there to make 
sure that the machine gets reboot within a given timeout anyway in case 
some userspace takes too long to shut down ?

Christophe

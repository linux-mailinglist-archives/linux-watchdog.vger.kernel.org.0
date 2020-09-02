Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B37C25AC5A
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Sep 2020 15:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgIBNwn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 2 Sep 2020 09:52:43 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:21160 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727919AbgIBNvM (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 2 Sep 2020 09:51:12 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4BhPgP6btKz9txSj;
        Wed,  2 Sep 2020 15:20:01 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id 13JB8Zw2mRHx; Wed,  2 Sep 2020 15:20:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4BhPgP5Fxbz9txSG;
        Wed,  2 Sep 2020 15:20:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 224D08B7EA;
        Wed,  2 Sep 2020 15:20:03 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id LzA1l6PiP3U8; Wed,  2 Sep 2020 15:20:03 +0200 (CEST)
Received: from [10.25.210.31] (po15451.idsi0.si.c-s.fr [10.25.210.31])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id E8F728B7E9;
        Wed,  2 Sep 2020 15:20:02 +0200 (CEST)
Subject: Re: watchdog start on restart
To:     Ivan Mikhaylov <i.mikhaylov@yadro.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <d2343032814705f33cd81f18f45630bf327c0ff8.camel@yadro.com>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e04bc12d-4520-89db-699c-ad89fcdbf76e@csgroup.eu>
Date:   Wed, 2 Sep 2020 15:19:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d2343032814705f33cd81f18f45630bf327c0ff8.camel@yadro.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



Le 02/09/2020 à 15:02, Ivan Mikhaylov a écrit :
> Hello everyone. Currently, the watchdog interface only has "stop watchdog on
> restart" but lacks a "start watchdog on restart" one. Is there a way to achieve
> such functionality?
> 
> I'd like to know why "stop watchdog on restart" wasn't implemented via ioctl
> interface? It would be more convenient from user perspective and you can
> control that behavior whenever you want from application layer.
> 
> I have some thoughts on this problem that solve the aforementioned
> issue with "start watchdog on restart" but I don't think that my solution is
> correct.
> 


I don't understand why a "start watchdog on restart" would be needed. 
Isn't it the default expected behaviour for a watchdog ?

"stop watchdog on restart" is there to keep things under control during 
a wanted machine reboot/restart, while still having the watchdog do its 
job on an unexpected restart.

What would be the advantage of an ioctl() compared to the existing way ?

Christophe

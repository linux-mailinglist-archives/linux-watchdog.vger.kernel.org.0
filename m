Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23D4214CFB3
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jan 2020 18:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbgA2Rd0 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 29 Jan 2020 12:33:26 -0500
Received: from mail-yb1-f180.google.com ([209.85.219.180]:44230 "EHLO
        mail-yb1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726679AbgA2Rd0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 29 Jan 2020 12:33:26 -0500
Received: by mail-yb1-f180.google.com with SMTP id f136so211906ybg.11
        for <linux-watchdog@vger.kernel.org>; Wed, 29 Jan 2020 09:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vYRWwkNsG6P/l0hKxY6xuNUyyLw1469YqUuJ7zXtwYU=;
        b=Dn7WvORQbDlHzC57uNhuCVrhlwpuwuyN5FB1BqBQtECqZ6tknjXCzChPa33hOqkntO
         ke1qtuRHb38LoT2xrBha+txRAW+WaMFxyYKJpbHaacFG2BlweSXakLht7Tt/01unDoWF
         8QU1PGGxVN6jn9Qvr7SPGY9N65RlbWSVHtVYNxuZ26OSbomgHBtftoqHKGUuQT/r0H70
         3Tw9c3jEVRjuxIIuZGLQTLAsXfxnlBjv7A6yR5Gy6327Csdxnc+wXuW9Rj5sIMDcFm4A
         pAdr2KZSub82K2Rtj+l0TRb+ZUq7KVZGLqXEI5ZlXA4sn1eVOZKnDQhTLS/6ShzGRPAQ
         o5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=vYRWwkNsG6P/l0hKxY6xuNUyyLw1469YqUuJ7zXtwYU=;
        b=MjdAjdv5nXuxf09+zKm/HHhgue3QWxMuZ4fjT8eFqzmFql13+/HmwmThGsw1GIrrZS
         An9oUYQ97kGYijXPG9J3djBnYrnUEPYgS1K5yzbV6VDywzAuVdJDjdt84RBpokXE32Z/
         5K11qcu+WQ2WsvWYUmoCl2DgyON3aM8CdL1auPmkPlMCzAFQD01kY7LLbGkUenUsrxny
         zZGM0yItw2pXc965rsOjhPIQwvXQP7QwOCWXym2qn9WdzMPhkGRM6rl04+YIV2cl0H9z
         uqBrImjKYmDqcMoUM9WycnmBrchij9L5+oPqqOH1E0eNN/RZ5s1Eax4FeLYS3054oJRW
         GVrA==
X-Gm-Message-State: APjAAAUWDB8BTxfyjOdfbjb4NiY+v5jKErDNwoIiX1i5XG6BRFGn2dqX
        JJ+oPleewdtNeqJCKcjLOfiK/DVe
X-Google-Smtp-Source: APXvYqxf4Oev5S1KrerqmFYDLibADvErKeffS+0KRA1gqnkjLk+PI7qYSXNO8NyYlS5Fbs4OQwGlnA==
X-Received: by 2002:a5b:b4f:: with SMTP id b15mr517975ybr.156.1580319205230;
        Wed, 29 Jan 2020 09:33:25 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d199sm1228951ywh.83.2020.01.29.09.33.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2020 09:33:24 -0800 (PST)
Date:   Wed, 29 Jan 2020 09:33:22 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Ulrich Hecht <uli@fpond.eu>
Cc:     linux-watchdog@vger.kernel.org, wsa@the-dreams.de
Subject: Re: Best practice when probe fails on armed watchdog?
Message-ID: <20200129173322.GA7138@roeck-us.net>
References: <1731064051.261328.1580318179697@webmail.strato.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1731064051.261328.1580318179697@webmail.strato.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, Jan 29, 2020 at 06:16:19PM +0100, Ulrich Hecht wrote:
> Hi!
> 
> What is the right thing to do when a watchdog device that has been armed by the bootloader fails to probe? Should the driver
> 
> - disable the device and thus save the system from being torn down by a potentially malfunctioning watchdog, at the risk of missing issues further down the line, or
> - leave it as is (even though that would most likely result in a reset), hoping that the error is either transient or that there is a mechanism in place outside the kernel that will resolve it?
> 
> Is there a best practice for this case?
> 

I'd first ask _why_ the watchdog fails to probe. It may well be that
the hardware simply does not exist, or that the provided address points
to something else. Since that can happen, the driver should probably
not touch the HW at all if instantiating it fails. 

Guenter

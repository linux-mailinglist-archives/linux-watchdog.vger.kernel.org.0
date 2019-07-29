Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14EFA78E28
	for <lists+linux-watchdog@lfdr.de>; Mon, 29 Jul 2019 16:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbfG2OiS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 29 Jul 2019 10:38:18 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:39075 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfG2OiS (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 29 Jul 2019 10:38:18 -0400
Received: by mail-pf1-f193.google.com with SMTP id f17so24152494pfn.6
        for <linux-watchdog@vger.kernel.org>; Mon, 29 Jul 2019 07:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:user-agent:mime-version;
        bh=jgxvekQ4OFyINZM7yp2FV+Kc3k2vAwxr39Z0I5y5cgM=;
        b=GQfND9RnH9LXrR2BrBpnQVHNe8csnGNuoebnxEa6dtdqZM6moDqw1VyJ1jKK4T0WAk
         Yx49eTuGAcdSSNG5EYLLQ3zeETD0UpX4vECR0csbebPD55XOTSwV+TaD8VygPJUZzGlr
         6WusL1kC0y3U2IQwS/NMfle+4BRvEtlpuy63E1uf1Zi+o2XtPSVK2wKDzCQmIGsRbWZY
         eC8fur+03v4i3O0/bA2H5VVaibvBbisk4ikPz8VidvJ13CRAZjgSOWoRl5Nl3pIf0Qe3
         VWkIKZ8f6c26iSKBN7cNbUaAvv1LGXRpRej5gbKX+bM69FoDgz7AWdbUfkraRJ8sFbrX
         rsGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:user-agent
         :mime-version;
        bh=jgxvekQ4OFyINZM7yp2FV+Kc3k2vAwxr39Z0I5y5cgM=;
        b=M2EyW1CF4NMrSxTumTa4Y0sekkokMHB6sevpE0BaIIIzgpNPBJktzoqUOjmr+f6nId
         LoUyXn8rv+KEdmOOt5PTPuEn9Wh18Aq8nxJ5Bs60hkVP/aCNolw7A4zVq7OddIXDYQCJ
         PeKtvMWnI5Xl/PIiA2KGogrBO+hrwhnUM8Cahb5+R1KxV68+N3wuHesSdPNB4mt+W+Ur
         MUqEDKWYSgKzpatMO+VQ//XYULIkJGuVMQdGcZJMRDoZ292bBbnpvxipZtIFkjCPrNuJ
         T3OSYCM/eEtbXhqdSG/LC102MUJzho6HPwVwdDAGlP2xqwpilBcDEBKx7K73SIURcQF8
         49Hg==
X-Gm-Message-State: APjAAAVpz7UPoBEVk/p36DpEPhaJI4JjNsI3O2WsBZISGl2u88tZq531
        rqeHuvLt9mqElDXyayEGFRpILgIi3mw=
X-Google-Smtp-Source: APXvYqxRPyiayJXt+L7ZLqfBpuWzW+0U1QaXoGpgL/vKyUljI3KQNLtW4t6LfhhSukoIlDUtcY1IXw==
X-Received: by 2002:a17:90a:d998:: with SMTP id d24mr84938635pjv.89.1564411097845;
        Mon, 29 Jul 2019 07:38:17 -0700 (PDT)
Received: from mbalantz-desktop (d206-116-172-62.bchsia.telus.net. [206.116.172.62])
        by smtp.gmail.com with ESMTPSA id m4sm74300375pgs.71.2019.07.29.07.38.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 07:38:17 -0700 (PDT)
From:   Mark Balantzyan <mbalant3@gmail.com>
X-Google-Original-From: Mark Balantzyan <mbalantz@mbalantz-desktop>
Date:   Mon, 29 Jul 2019 07:38:12 -0700 (PDT)
To:     linux@roeck-us.net
cc:     wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Subject: Question about pc87413_wdt.ko
Message-ID: <alpine.DEB.2.21.1907290727580.33358@mbalantz-desktop>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Guenter,

My name is Mark, we corresponded in the recent past concerning a different 
kernel module.

I would just like to ask a question about pc87413_wdt.ko. In 
pc87413_wdt.c, the function pc87413_init() calls pc87413_swc_base_addr() 
and swc_base_addr gets assigned to. But pc87413_open() calls pc87413_refresh() 
which has spinlocks around swc_base_addr. There may be a use before 
initialization, so spinlocks get in the way. Is there a case possible 
where a bug/race condition may be occurring here? Or is there a hardware 
synchronization somewhere?

Thank you,
Mark

Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B3CE94F1F
	for <lists+linux-watchdog@lfdr.de>; Mon, 19 Aug 2019 22:37:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728018AbfHSUhR (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 19 Aug 2019 16:37:17 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40407 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727971AbfHSUhQ (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 19 Aug 2019 16:37:16 -0400
Received: by mail-oi1-f195.google.com with SMTP id h21so2364696oie.7
        for <linux-watchdog@vger.kernel.org>; Mon, 19 Aug 2019 13:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:date:message-id:reply-to;
        bh=i0nL7H4Qv3RsnhZE+NkGDpYFwD1THWoey5/q2SZ9MTE=;
        b=AhkEeGQ2nabd7kgxtoWa17W6dcHz5cT2dNIbYXkmFHtqbWdMNOLmX6Y/GIKIoj9kN3
         uhSgObMkxy4bQWtayAwAvC1At2I5dip3a99gteg6yDTXxiuqcTOI9aEOflwJ0TOAePcb
         x916OhpbifzrWdU2eVMfQBxuz9uLjN3t2LJTpui8rWSlChiTifzMMXSTv2umzIuTFoVb
         HHo2LRs9Obgi0SN/V/zjhDGa3BCH3TOb0NCrz9hNwwH2wrJZSdfEIsuGwevkVgEHsVSM
         yM9HpojqCX9GcbLdqUokNuvaGqSp8pFW5ZN++lUlkRfanztqF3dYBl7jurYWnA/uqgrV
         FXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:date:message-id:reply-to;
        bh=i0nL7H4Qv3RsnhZE+NkGDpYFwD1THWoey5/q2SZ9MTE=;
        b=F++J0X1DIwf+AV2FTfy4/F5aw6fK7xmOhK1yqhDzQFi3i7MUyo0JhQ2naDA8P9kwFG
         yl2U1DvcfLL2XvCQHooieu5VyS+QhvXJ1LFw2LANgcmBmO+Mzn+RCJzK/P9xGvKjWqg2
         AhKY/zPuHyE4wFfLuEb9GU3Y+YaQXMFzALpql606lqn2GxtXnwMlU8S6Fedd0H4lkyOZ
         ZKB6NkdJFHWHoM54zMhtgxvetEq2jVRtgP/SmR8jGd8JHJiY9dvQ2ZBXNDnEXNKrlvmM
         d4+1KOaO4vSwXF5SiGhcDxHugL6RnueibdYK+BxXmCPNgHZpfbmO1pD/n9cZ1Hw8jWuZ
         JGCw==
X-Gm-Message-State: APjAAAU4K32xZKEUi6z+aCWXIGRyj7VK0w2IpmDsP+90nUB0iJvw5EzW
        mAGcZ6FNalDiSfb5m/YYKw==
X-Google-Smtp-Source: APXvYqzzF46Y3ejhVgxtGdakkWVPTDPLfHjDSusQ/3agp+tlggIJSiAwDm2UXPLTJcprd+Y27y9D2A==
X-Received: by 2002:aca:5c3:: with SMTP id 186mr10920184oif.37.1566247035427;
        Mon, 19 Aug 2019 13:37:15 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id r8sm5524812oti.76.2019.08.19.13.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 13:37:15 -0700 (PDT)
Received: from t430.minyard.net (t430m.minyard.net [192.168.27.3])
        by serve.minyard.net (Postfix) with ESMTPA id E48931800D0;
        Mon, 19 Aug 2019 20:37:13 +0000 (UTC)
Received: by t430.minyard.net (Postfix, from userid 1000)
        id CD674301220; Mon, 19 Aug 2019 15:37:13 -0500 (CDT)
From:   minyard@acm.org
To:     linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: 
Date:   Mon, 19 Aug 2019 15:36:59 -0500
Message-Id: <20190819203711.32599-1-minyard@acm.org>
X-Mailer: git-send-email 2.17.1
Reply-To: "[PATCH 00/12]"@minyard.net, Convert@minyard.net,
          the@minyard.net, IPMI@minyard.net, watchdog@minyard.net,
          to@minyard.net, the@minyard.net, standard@minyard.net,
          interface@minyard.net
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The IPMI watchdog interface rolled its own ioctl, because in the beginning
that's the way it was, and later because it had a lot of capabilities
that were not in the standard interface.

This patch set attempts to add those capabilities into the standard
interface and move the IPMI watchdog over to that interface.  The
changes are:

  * Add a pretimeout governor that provides read data on the watchdog
    device when a pretimeout happens.
  * Add the ability to set the action that occurs when a timeout happens.
    The IPMI device and power off or power cycle the system.  I noticed
    that some other devices can sound alarms and such, I think an interface
    like this is a good idea.
  * Add the ability to get/set the action that occurs when a pretimeout
    happens.  IPMI can send an NMI, SMI, or normal interrupt.  I also
    did a patch that fills out the other drivers that had pretimeouts
    so the get operation returns the right value.
  * Add an ioctl to get/set the current pretimeout governor.  It seemed
    like something that was missing.
  * Add a sample program that can do all the watchdog IOCTLs.  Useful
    for testing, if nothing else.

The IPMI watchdog driver still keeps it's current module parameter
configuration, it just goes through the standard watchdog interface
now.  I'm going to deprecate the module parameters at some point
because it's kind of awkward.

There's also a small bug fix (I think) where the default governor is
not NULL-ed when it is unregistered.

-corey


